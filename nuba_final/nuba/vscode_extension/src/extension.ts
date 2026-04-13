// extension.ts — VSCode extension for the Nuba programming language
import * as vscode from 'vscode';
import * as cp    from 'child_process';
import * as path  from 'path';

let outputChannel: vscode.OutputChannel;

export function activate(context: vscode.ExtensionContext) {
    outputChannel = vscode.window.createOutputChannel('Nuba');

    // ── Run File ─────────────────────────────────────────────────────────
    const runFile = vscode.commands.registerCommand('nuba.runFile', () => {
        const editor = vscode.window.activeTextEditor;
        if (!editor) { vscode.window.showWarningMessage('No active editor'); return; }

        const doc  = editor.document;
        if (doc.isDirty) { doc.save(); }

        const file   = doc.fileName;
        const config = vscode.workspace.getConfiguration('nuba');
        const exe    = config.get<string>('executablePath', 'nuba');

        if (config.get('clearOutputOnRun', false)) { outputChannel.clear(); }
        if (config.get('showOutputOnRun', true))   { outputChannel.show(true); }

        outputChannel.appendLine(`\n── Running: ${path.basename(file)} ──`);
        outputChannel.appendLine(new Date().toLocaleTimeString());
        outputChannel.appendLine('');

        const proc = cp.spawn(exe, [file], {
            cwd: path.dirname(file),
            env: process.env,
        });

        proc.stdout.on('data', (d: Buffer) => outputChannel.append(d.toString()));
        proc.stderr.on('data', (d: Buffer) => outputChannel.append(d.toString()));
        proc.on('close', (code: number) => {
            outputChannel.appendLine(`\n── Exit code: ${code} ──\n`);
        });
        proc.on('error', (err: Error) => {
            if ((err as any).code === 'ENOENT') {
                vscode.window.showErrorMessage(
                    `nuba not found. Install it or set "nuba.executablePath" in settings.`
                );
            }
        });
    });

    // ── Open REPL ─────────────────────────────────────────────────────────
    const openREPL = vscode.commands.registerCommand('nuba.runREPL', () => {
        const config = vscode.workspace.getConfiguration('nuba');
        const exe    = config.get<string>('executablePath', 'nuba');
        const term   = vscode.window.createTerminal({ name: 'Nuba REPL' });
        term.sendText(exe);
        term.show();
    });

    // ── Check Syntax ─────────────────────────────────────────────────────
    const checkSyntax = vscode.commands.registerCommand('nuba.checkSyntax', () => {
        const editor = vscode.window.activeTextEditor;
        if (!editor) { return; }

        const doc  = editor.document;
        if (doc.isDirty) { doc.save(); }

        const config = vscode.workspace.getConfiguration('nuba');
        const exe    = config.get<string>('executablePath', 'nuba');

        const proc = cp.spawn(exe, ['--check', doc.fileName]);
        let out = '';
        proc.stdout.on('data', (d: Buffer) => { out += d.toString(); });
        proc.stderr.on('data', (d: Buffer) => { out += d.toString(); });
        proc.on('close', (code: number) => {
            if (code === 0) {
                vscode.window.showInformationMessage(`✓ Syntax OK: ${path.basename(doc.fileName)}`);
            } else {
                vscode.window.showErrorMessage(`✗ Syntax error: ${out.trim()}`);
            }
        });
    });

    // ── Show AST ──────────────────────────────────────────────────────────
    const showAST = vscode.commands.registerCommand('nuba.showAST', () => {
        const editor = vscode.window.activeTextEditor;
        if (!editor) { return; }

        const config = vscode.workspace.getConfiguration('nuba');
        const exe    = config.get<string>('executablePath', 'nuba');

        const proc = cp.spawn(exe, ['--ast', editor.document.fileName]);
        let out = '';
        proc.stdout.on('data', (d: Buffer) => { out += d.toString(); });
        proc.stderr.on('data', (d: Buffer) => { out += d.toString(); });
        proc.on('close', () => {
            vscode.workspace.openTextDocument({ content: out, language: 'text' })
                .then(doc => vscode.window.showTextDocument(doc));
        });
    });

    // ── Diagnostic provider (syntax errors on save) ───────────────────────
    const diagnostics = vscode.languages.createDiagnosticCollection('nuba');

    vscode.workspace.onDidSaveTextDocument((doc) => {
        if (doc.languageId !== 'nuba') { return; }

        const config = vscode.workspace.getConfiguration('nuba');
        const exe    = config.get<string>('executablePath', 'nuba');

        const proc = cp.spawn(exe, ['--check', doc.fileName]);
        let out = '';
        proc.stderr.on('data', (d: Buffer) => { out += d.toString(); });
        proc.on('close', (code: number) => {
            diagnostics.delete(doc.uri);
            if (code !== 0 && out) {
                // parse "filename:line:col: message"
                const match = out.match(/:(\d+):(\d+):\s*(.+)/);
                if (match) {
                    const line = parseInt(match[1]) - 1;
                    const col  = parseInt(match[2]) - 1;
                    const msg  = match[3];
                    const range = new vscode.Range(line, col, line, col + 20);
                    const diag  = new vscode.Diagnostic(range, msg, vscode.DiagnosticSeverity.Error);
                    diag.source = 'nuba';
                    diagnostics.set(doc.uri, [diag]);
                }
            }
        });
    });

    // ── Status bar item ───────────────────────────────────────────────────
    const statusBar = vscode.window.createStatusBarItem(vscode.StatusBarAlignment.Left, 100);
    statusBar.command = 'nuba.runFile';
    statusBar.text    = '$(play) Run Nuba';
    statusBar.tooltip = 'Run current .nu file (Ctrl+F5)';

    vscode.window.onDidChangeActiveTextEditor((editor) => {
        if (editor && editor.document.languageId === 'nuba') {
            statusBar.show();
        } else {
            statusBar.hide();
        }
    });
    if (vscode.window.activeTextEditor?.document.languageId === 'nuba') {
        statusBar.show();
    }

    context.subscriptions.push(
        runFile, openREPL, checkSyntax, showAST,
        diagnostics, statusBar, outputChannel
    );
}

export function deactivate() {
    outputChannel?.dispose();
}
