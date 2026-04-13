# install_windows.ps1  —  Nuba installer for Windows
# Run as Administrator for system-wide install, or normally for user install
# Usage:  powershell -ExecutionPolicy Bypass -File install_windows.ps1

#Requires -Version 5.1
param(
    [switch]$Uninstall,
    [switch]$SystemWide,
    [string]$InstallPath = ""
)

$ErrorActionPreference = "Stop"
$NubaVersion = "1.0.0"

# ── Colors ──────────────────────────────────────────────────────────────
function Write-Info    { Write-Host "[nuba] $args" -ForegroundColor Cyan }
function Write-Success { Write-Host "[nuba] $args" -ForegroundColor Green }
function Write-Warn    { Write-Host "[nuba] $args" -ForegroundColor Yellow }
function Write-Err     { Write-Host "[nuba] error: $args" -ForegroundColor Red; exit 1 }

# ── Determine install location ────────────────────────────────────────────
$IsAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if ($InstallPath -ne "") {
    $InstallDir = $InstallPath
} elseif ($SystemWide -or $IsAdmin) {
    $InstallDir = "C:\Program Files\Nuba"
} else {
    $InstallDir = "$env:LOCALAPPDATA\Nuba"
}

$BinDir     = "$InstallDir\bin"
$LibDir     = "$InstallDir\lib"
$StdlibDir  = "$LibDir\stdlib"
$NubaExe    = "$BinDir\nuba.exe"  # wrapper .exe built from nuba_launcher.py
$NubaCmd    = "$BinDir\nuba.cmd"
$NubaPS1    = "$BinDir\nuba.ps1"

# ── Banner ────────────────────────────────────────────────────────────────
Write-Host ""
Write-Host "╔════════════════════════════════════════════╗" -ForegroundColor Magenta
Write-Host "║  Nuba Programming Language Installer       ║" -ForegroundColor Magenta
Write-Host "║  Version $NubaVersion                           ║" -ForegroundColor Magenta
Write-Host "╚════════════════════════════════════════════╝" -ForegroundColor Magenta
Write-Host ""

# ── Uninstall ─────────────────────────────────────────────────────────────
if ($Uninstall) {
    Write-Info "Uninstalling Nuba $NubaVersion ..."

    # Remove from PATH
    $currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
    $newPath = ($currentPath -split ';' | Where-Object { $_ -ne $BinDir }) -join ';'
    [Environment]::SetEnvironmentVariable("Path", $newPath, "User")

    # Remove file association
    Remove-Item -Path "HKCU:\Software\Classes\.nu"              -Recurse -ErrorAction SilentlyContinue
    Remove-Item -Path "HKCU:\Software\Classes\NubaSourceFile"   -Recurse -ErrorAction SilentlyContinue

    # Remove install directory
    if (Test-Path $InstallDir) { Remove-Item -Recurse -Force $InstallDir }

    # Remove Start Menu shortcut
    $shortcut = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Nuba"
    if (Test-Path $shortcut) { Remove-Item -Recurse -Force $shortcut }

    Write-Success "Nuba has been uninstalled."
    exit 0
}

# ── Check Python ──────────────────────────────────────────────────────────
Write-Info "Checking Python installation..."
$Python = $null
foreach ($cmd in @("python3","python","py")) {
    try {
        $ver = & $cmd -c "import sys; v=sys.version_info; print(v.major*10+v.minor)" 2>$null
        if ($ver -and [int]$ver -ge 38) {
            $Python = $cmd
            $PyVer  = & $cmd --version 2>&1
            Write-Success "Found: $PyVer"
            break
        }
    } catch {}
}
if (-not $Python) {
    Write-Err "Python 3.8+ not found.`n  Install from: https://www.python.org/downloads/"
}

# ── Create directories ────────────────────────────────────────────────────
Write-Info "Creating installation directories..."
@($InstallDir, $BinDir, $LibDir, $StdlibDir) | ForEach-Object {
    if (-not (Test-Path $_)) { New-Item -ItemType Directory -Force $_ | Out-Null }
}

# ── Copy Nuba files ───────────────────────────────────────────────────────
$SourceDir = Split-Path -Parent $PSCommandPath
Write-Info "Installing Nuba to: $InstallDir"
Copy-Item -Recurse -Force "$SourceDir\nuba"      "$LibDir\"
Copy-Item -Recurse -Force "$SourceDir\stdlib"    "$LibDir\"
Copy-Item -Force          "$SourceDir\nuba_cli.py" "$LibDir\"
if (Test-Path "$SourceDir\examples") {
    Copy-Item -Recurse -Force "$SourceDir\examples" "$InstallDir\"
}

# ── Create nuba.cmd launcher ──────────────────────────────────────────────
Write-Info "Creating nuba.cmd launcher..."
@"
@echo off
"$Python" "$LibDir\nuba_cli.py" %*
exit /b %errorlevel%
"@ | Set-Content -Encoding ASCII "$NubaCmd"

# ── Create nuba.ps1 launcher ──────────────────────────────────────────────
@"
& "$Python" "$LibDir\nuba_cli.py" @args
exit `$LASTEXITCODE
"@ | Set-Content -Encoding UTF8 "$NubaPS1"

# ── Register .nu file association ─────────────────────────────────────────
Write-Info "Registering .nu file association..."

# HKCU: works without admin
$regBase = "HKCU:\Software\Classes"

# .nu extension
$nuKey = "$regBase\.nu"
New-Item -Force -Path $nuKey | Out-Null
Set-ItemProperty -Path $nuKey -Name "(default)" -Value "NubaSourceFile"
Set-ItemProperty -Path $nuKey -Name "Content Type" -Value "text/x-nuba"
Set-ItemProperty -Path $nuKey -Name "PerceivedType" -Value "text"

# NubaSourceFile type
$nubaClass = "$regBase\NubaSourceFile"
New-Item -Force -Path $nubaClass | Out-Null
Set-ItemProperty -Path $nubaClass -Name "(default)" -Value "Nuba Source File"

# Default icon
$iconKey = "$nubaClass\DefaultIcon"
New-Item -Force -Path $iconKey | Out-Null
Set-ItemProperty -Path $iconKey -Name "(default)" -Value "$Python,0"

# Open command:  nuba.cmd %1 %*
$openKey = "$nubaClass\shell\open\command"
New-Item -Force -Path $openKey | Out-Null
Set-ItemProperty -Path $openKey -Name "(default)" -Value "`"$NubaCmd`" `"%1`" %*"

# "Run with Nuba" context menu
$runKey = "$nubaClass\shell\Run with Nuba\command"
New-Item -Force -Path $runKey | Out-Null
Set-ItemProperty -Path $runKey -Name "(default)" -Value "`"$NubaCmd`" `"%1`""

# "Check Syntax" context menu
$checkKey = "$nubaClass\shell\Check Syntax\command"
New-Item -Force -Path $checkKey | Out-Null
Set-ItemProperty -Path $checkKey -Name "(default)" -Value "`"$NubaCmd`" --check `"%1`" && pause"

# Edit with Notepad context menu
$editKey = "$nubaClass\shell\Edit\command"
New-Item -Force -Path $editKey | Out-Null
Set-ItemProperty -Path $editKey -Name "(default)" -Value "notepad.exe `"%1`""

# Notify Explorer of file association change
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class ShellHelper {
    [DllImport("shell32.dll")] public static extern void SHChangeNotify(int wEventId, uint uFlags, IntPtr dwItem1, IntPtr dwItem2);
}
"@
[ShellHelper]::SHChangeNotify(0x08000000, 0x0000, [IntPtr]::Zero, [IntPtr]::Zero)
Write-Success ".nu files now associated with Nuba"

# ── Add to PATH ───────────────────────────────────────────────────────────
Write-Info "Adding Nuba to PATH..."
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($currentPath -notlike "*$BinDir*") {
    [Environment]::SetEnvironmentVariable("Path", "$BinDir;$currentPath", "User")
    Write-Success "Added $BinDir to User PATH"
} else {
    Write-Info "$BinDir already in PATH"
}

# Also update current session
$env:Path = "$BinDir;$env:Path"

# ── Create Start Menu shortcuts ───────────────────────────────────────────
Write-Info "Creating Start Menu shortcuts..."
$startMenu = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Nuba"
if (-not (Test-Path $startMenu)) { New-Item -ItemType Directory -Force $startMenu | Out-Null }

$shell = New-Object -ComObject WScript.Shell

# REPL shortcut
$repl = $shell.CreateShortcut("$startMenu\Nuba REPL.lnk")
$repl.TargetPath       = "cmd.exe"
$repl.Arguments        = "/k `"$NubaCmd`""
$repl.Description      = "Nuba Interactive REPL"
$repl.WorkingDirectory = $env:USERPROFILE
$repl.Save()

# Examples shortcut
$examplesShortcut = $shell.CreateShortcut("$startMenu\Nuba Examples.lnk")
$examplesShortcut.TargetPath  = "$InstallDir\examples"
$examplesShortcut.Description = "Nuba example programs"
$examplesShortcut.Save()

# Uninstall shortcut
$uninstShortcut = $shell.CreateShortcut("$startMenu\Uninstall Nuba.lnk")
$uninstShortcut.TargetPath = "powershell.exe"
$uninstShortcut.Arguments  = "-ExecutionPolicy Bypass -File `"$SourceDir\install\install_windows.ps1`" -Uninstall"
$uninstShortcut.Description = "Uninstall Nuba"
$uninstShortcut.Save()

# ── Verify ────────────────────────────────────────────────────────────────
Write-Info "Verifying installation..."
try {
    $ver = & "$NubaCmd" --version 2>&1
    Write-Success "Verified: $ver"
} catch {
    Write-Warn "Could not verify — restart your terminal and run: nuba --version"
}

# ── Done ──────────────────────────────────────────────────────────────────
Write-Host ""
Write-Host "╔════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║    Nuba installed successfully!            ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""
Write-Host "  Install dir : $InstallDir"
Write-Host "  Executable  : $NubaCmd"
Write-Host ""
Write-Host "  Next steps:"
Write-Host "  1. Open a NEW terminal window"
Write-Host "  2. Run:  nuba --version"
Write-Host "  3. Try:  nuba examples\hello.nu"
Write-Host "  4. REPL: nuba"
Write-Host ""
Write-Host "  .nu files will now open with Nuba when double-clicked!"
Write-Host ""
Write-Host "  Docs: https://docs.nuba-lang.org"
Write-Host ""
