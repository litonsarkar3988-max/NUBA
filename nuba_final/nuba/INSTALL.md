# Installing Nuba Programming Language

Nuba works on **Linux**, **macOS**, and **Windows**.  
Requires **Python 3.8+** (no other dependencies).

---

## Quick Install

### Linux / macOS
```bash
# Clone or unzip
git clone https://github.com/nuba-lang/nuba
cd nuba

# Install (user)
bash install/install.sh

# Or install system-wide
sudo bash install/install.sh

# Restart terminal, then:
nuba --version
nuba examples/hello.nu
```

### Windows
```powershell
# In PowerShell (as Administrator for system-wide):
cd nuba
powershell -ExecutionPolicy Bypass -File install\install_windows.ps1

# Opens new terminal, then:
nuba --version
nuba examples\hello.nu
```

### Via pip
```bash
pip install nuba-lang

# Or from source:
pip install -e .

# Then:
nuba --version
```

### Via make
```bash
cd nuba
make install          # user install (~/.local)
make install-system   # system install (needs sudo)
```

---

## What Gets Installed

| Path | Contents |
|------|----------|
| `~/.local/bin/nuba` | The `nuba` executable |
| `~/.local/lib/nuba/nuba/` | Nuba language engine |
| `~/.local/lib/nuba/stdlib/` | Standard library |
| `~/.local/lib/nuba/examples/` | Example programs |

---

## PATH Setup

After install, add to your shell config if not automatic:

**bash / zsh:**
```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

**fish:**
```fish
fish_add_path ~/.local/bin
```

**Windows** (PowerShell):
```powershell
# Already done by installer — restart terminal
```

---

## File Association (.nu files)

After installation, `.nu` files are automatically associated:

- **Linux:** `.nu` files open with Nuba in your file manager
- **macOS:** Double-click `.nu` files to run them in Terminal
- **Windows:** Double-click `.nu` files to run them in cmd.exe

### Manual registration

**Linux:**
```bash
xdg-mime install --novendor registry/x-nuba.xml
update-mime-database ~/.local/share/mime
xdg-desktop-menu install registry/nuba.desktop
```

**Windows** (import the registry file):
```
registry\nuba_association.reg  →  double-click to import
```

---

## Shebang Support (Linux/macOS)

Make `.nu` files directly executable:
```nuba
#!/usr/bin/env nuba
print("Hello from Nuba!")
```
```bash
chmod +x myscript.nu
./myscript.nu
```

---

## VSCode Extension

Install syntax highlighting and run support:

1. Open VSCode
2. Extensions (Ctrl+Shift+X)
3. Search: `nuba-lang`
4. Install

Or manually from the `vscode_extension/` folder:
```bash
cd vscode_extension
npm install
npm run compile
# Then in VSCode: Extensions → Install from VSIX
```

---

## Uninstall

```bash
# User install
bash install/install.sh --uninstall

# macOS
bash install/install_macos.sh --uninstall

# Windows
powershell -ExecutionPolicy Bypass -File install\install_windows.ps1 -Uninstall

# pip
pip uninstall nuba-lang

# make
make uninstall
```

---

## Verify Installation

```bash
nuba --version          # Nuba 1.0.0
nuba -c 'print("OK")'  # OK
nuba examples/my.nu    # Full demo
nuba                   # Interactive REPL
```

---

## Troubleshooting

**`nuba: command not found`**
→ `~/.local/bin` is not in PATH. Add it:
```bash
export PATH="$HOME/.local/bin:$PATH"
```

**`Python 3 not found`**
→ Install Python: https://python.org/downloads

**Permission denied on `.sh` files**
```bash
chmod +x install/install.sh
```

**Windows: execution policy error**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
