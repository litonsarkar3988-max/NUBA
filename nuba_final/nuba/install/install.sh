#!/usr/bin/env bash
# install.sh  —  Install Nuba Programming Language on Linux / macOS
# Usage:
#   bash install.sh            # install for current user (~/.local)
#   sudo bash install.sh       # install system-wide (/usr/local)
#   bash install.sh --uninstall

set -euo pipefail

# ── Config ────────────────────────────────────────────────────────────────
NUBA_VERSION="1.0.0"
NUBA_NAME="nuba"

# Detect install prefix
if [[ $EUID -eq 0 ]]; then
    PREFIX="/usr/local"
    SHELL_PROFILE="/etc/profile.d/nuba.sh"
else
    PREFIX="$HOME/.local"
    SHELL_PROFILE="$HOME/.nuba_profile"
fi

INSTALL_DIR="$PREFIX/lib/nuba"
BIN_DIR="$PREFIX/bin"
STDLIB_DIR="$INSTALL_DIR/stdlib"

# ── Colors ────────────────────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; BOLD='\033[1m'; RESET='\033[0m'

info()    { echo -e "${BLUE}[nuba]${RESET} $*"; }
success() { echo -e "${GREEN}[nuba]${RESET} $*"; }
warn()    { echo -e "${YELLOW}[nuba]${RESET} $*"; }
error()   { echo -e "${RED}[nuba] error:${RESET} $*" >&2; exit 1; }

# ── Uninstall ─────────────────────────────────────────────────────────────
if [[ "${1:-}" == "--uninstall" ]]; then
    info "Uninstalling Nuba $NUBA_VERSION..."
    rm -f  "$BIN_DIR/nuba"
    rm -rf "$INSTALL_DIR"
    # Remove .nu association lines from profiles
    for f in "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.profile" "$SHELL_PROFILE"; do
        [[ -f "$f" ]] && sed -i '/# Nuba Programming Language/,/# End Nuba/d' "$f" 2>/dev/null || true
    done
    success "Nuba has been uninstalled."
    exit 0
fi

# ── Banner ────────────────────────────────────────────────────────────────
echo ""
echo -e "${BOLD}╔══════════════════════════════════════════╗${RESET}"
echo -e "${BOLD}║   Nuba Programming Language Installer   ║${RESET}"
echo -e "${BOLD}║              Version $NUBA_VERSION               ║${RESET}"
echo -e "${BOLD}╚══════════════════════════════════════════╝${RESET}"
echo ""

# ── Check Python ──────────────────────────────────────────────────────────
info "Checking Python installation..."
PYTHON=""
for cmd in python3 python; do
    if command -v "$cmd" &>/dev/null; then
        ver=$("$cmd" -c "import sys; print(sys.version_info.major * 10 + sys.version_info.minor)" 2>/dev/null || echo 0)
        if [[ "$ver" -ge 38 ]]; then
            PYTHON="$cmd"
            PY_VERSION=$("$cmd" --version 2>&1)
            success "Found $PY_VERSION"
            break
        fi
    fi
done
[[ -z "$PYTHON" ]] && error "Python 3.8+ is required. Install from https://python.org"

# ── Create directories ────────────────────────────────────────────────────
info "Creating directories..."
mkdir -p "$INSTALL_DIR"
mkdir -p "$BIN_DIR"
mkdir -p "$STDLIB_DIR"

# ── Find source directory ─────────────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── Copy package files ────────────────────────────────────────────────────
info "Installing Nuba package to $INSTALL_DIR ..."
cp -r "$SCRIPT_DIR/nuba"       "$INSTALL_DIR/"
cp -r "$SCRIPT_DIR/stdlib"     "$INSTALL_DIR/"
cp    "$SCRIPT_DIR/nuba_cli.py" "$INSTALL_DIR/"
[[ -d "$SCRIPT_DIR/examples" ]] && cp -r "$SCRIPT_DIR/examples" "$INSTALL_DIR/"

# ── Create executable ─────────────────────────────────────────────────────
info "Creating executable: $BIN_DIR/nuba ..."
cat > "$BIN_DIR/nuba" << EXECUTABLE
#!/usr/bin/env bash
# Nuba Programming Language launcher
NUBA_HOME="$INSTALL_DIR"
exec "$PYTHON" "\$NUBA_HOME/nuba_cli.py" "\$@"
EXECUTABLE
chmod +x "$BIN_DIR/nuba"

# ── .nu file association (xdg on Linux) ───────────────────────────────────
info "Registering .nu file type..."

# Create MIME type
if command -v xdg-mime &>/dev/null 2>&1; then
    MIME_XML="$HOME/.local/share/mime/packages/x-nuba.xml"
    mkdir -p "$(dirname "$MIME_XML")"
    cat > "$MIME_XML" << 'MIME'
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="text/x-nuba">
    <comment>Nuba source file</comment>
    <glob pattern="*.nu"/>
    <icon name="text-x-script"/>
  </mime-type>
</mime-info>
MIME
    xdg-mime install --novendor "$MIME_XML" 2>/dev/null || true

    # Desktop entry for opening .nu files
    DESKTOP="$HOME/.local/share/applications/nuba.desktop"
    mkdir -p "$(dirname "$DESKTOP")"
    cat > "$DESKTOP" << DESKTOP_EOF
[Desktop Entry]
Name=Nuba Interpreter
Comment=Run Nuba (.nu) source files
Exec=$BIN_DIR/nuba %f
Icon=utilities-terminal
Terminal=true
Type=Application
MimeType=text/x-nuba;
Categories=Development;
DESKTOP_EOF
    xdg-mime default nuba.desktop text/x-nuba 2>/dev/null || true
    update-mime-database "$HOME/.local/share/mime" 2>/dev/null || true
fi

# ── Shell PATH setup ──────────────────────────────────────────────────────
info "Configuring shell PATH..."

PATH_SNIPPET="
# Nuba Programming Language
export PATH=\"$BIN_DIR:\$PATH\"
# End Nuba"

# Add to PATH for various shells
for RC_FILE in "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.profile"; do
    if [[ -f "$RC_FILE" ]]; then
        if ! grep -q "Nuba Programming Language" "$RC_FILE" 2>/dev/null; then
            echo "$PATH_SNIPPET" >> "$RC_FILE"
            info "  Added PATH to $RC_FILE"
        fi
    fi
done

# fish shell
FISH_CONFIG="$HOME/.config/fish/config.fish"
if [[ -f "$FISH_CONFIG" ]]; then
    if ! grep -q "nuba" "$FISH_CONFIG" 2>/dev/null; then
        echo -e "\n# Nuba Programming Language\nfish_add_path $BIN_DIR\n# End Nuba" >> "$FISH_CONFIG"
        info "  Added PATH to fish config"
    fi
fi

# ── Verify installation ────────────────────────────────────────────────────
info "Verifying installation..."
if "$BIN_DIR/nuba" --version &>/dev/null; then
    INSTALLED_VER=$("$BIN_DIR/nuba" --version 2>&1)
    success "Installed: $INSTALLED_VER"
else
    warn "Verification failed — check your PATH after restarting your shell"
fi

# ── Done ──────────────────────────────────────────────────────────────────
echo ""
echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════╗${RESET}"
echo -e "${GREEN}${BOLD}║        Nuba installed successfully!     ║${RESET}"
echo -e "${GREEN}${BOLD}╚══════════════════════════════════════════╝${RESET}"
echo ""
echo -e "  Executable:  ${BOLD}$BIN_DIR/nuba${RESET}"
echo -e "  Install dir: ${BOLD}$INSTALL_DIR${RESET}"
echo ""
echo -e "  ${BOLD}Next steps:${RESET}"
echo -e "  1. Restart your terminal (or run: source ~/.bashrc)"
echo -e "  2. Run:  ${BOLD}nuba --version${RESET}"
echo -e "  3. Try:  ${BOLD}nuba examples/hello.nu${RESET}"
echo -e "  4. REPL: ${BOLD}nuba${RESET}"
echo ""
echo -e "  Docs: https://docs.nuba-lang.org"
echo ""
