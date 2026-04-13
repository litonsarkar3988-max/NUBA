#!/usr/bin/env bash
# install_macos.sh  —  Nuba installer for macOS
# Usage:
#   bash install_macos.sh           # user install (~/.local)
#   sudo bash install_macos.sh      # system install (/usr/local)
#   bash install_macos.sh --uninstall

set -euo pipefail
NUBA_VERSION="1.0.0"

# ── Colors ────────────────────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; BOLD='\033[1m'; RESET='\033[0m'
info()    { echo -e "${BLUE}[nuba]${RESET} $*"; }
success() { echo -e "${GREEN}[nuba]${RESET} $*"; }
warn()    { echo -e "${YELLOW}[nuba]${RESET} $*"; }
error()   { echo -e "${RED}[nuba] error:${RESET} $*" >&2; exit 1; }

# ── Install prefix ────────────────────────────────────────────────────────
if [[ $EUID -eq 0 ]]; then PREFIX="/usr/local"; else PREFIX="$HOME/.local"; fi
INSTALL_DIR="$PREFIX/lib/nuba"
BIN_DIR="$PREFIX/bin"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

# ── Uninstall ─────────────────────────────────────────────────────────────
if [[ "${1:-}" == "--uninstall" ]]; then
    info "Uninstalling Nuba $NUBA_VERSION..."
    rm -f  "$BIN_DIR/nuba"
    rm -rf "$INSTALL_DIR"
    for f in "$HOME/.zshrc" "$HOME/.bash_profile" "$HOME/.bashrc"; do
        [[ -f "$f" ]] && sed -i '' '/# Nuba Programming Language/,/# End Nuba/d' "$f" 2>/dev/null || true
    done
    # Remove .nu association from Launch Services
    /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister \
        -u "$INSTALL_DIR" 2>/dev/null || true
    success "Nuba uninstalled."
    exit 0
fi

# ── Banner ────────────────────────────────────────────────────────────────
echo ""
echo -e "${BOLD}╔══════════════════════════════════════════╗${RESET}"
echo -e "${BOLD}║  Nuba Programming Language — macOS      ║${RESET}"
echo -e "${BOLD}║  Version $NUBA_VERSION                           ║${RESET}"
echo -e "${BOLD}╚══════════════════════════════════════════╝${RESET}"
echo ""

# ── Check Python ──────────────────────────────────────────────────────────
info "Looking for Python 3.8+..."
PYTHON=""
for cmd in python3 python; do
    if command -v "$cmd" &>/dev/null; then
        v=$("$cmd" -c "import sys; print(sys.version_info.major*10+sys.version_info.minor)" 2>/dev/null || echo 0)
        if [[ "$v" -ge 38 ]]; then
            PYTHON="$cmd"
            success "Found: $($cmd --version)"
            break
        fi
    fi
done
[[ -z "$PYTHON" ]] && error "Python 3.8+ required.\n  Install: brew install python3\n  Or: https://python.org"

# ── Homebrew Nuba formula hint ────────────────────────────────────────────
if command -v brew &>/dev/null 2>&1; then
    info "Homebrew detected. You can also install via: brew install nuba-lang/tap/nuba"
fi

# ── Install ───────────────────────────────────────────────────────────────
info "Installing to $INSTALL_DIR ..."
mkdir -p "$INSTALL_DIR" "$BIN_DIR"
cp -r "$SOURCE_DIR/nuba"        "$INSTALL_DIR/"
cp -r "$SOURCE_DIR/stdlib"      "$INSTALL_DIR/"
cp    "$SOURCE_DIR/nuba_cli.py" "$INSTALL_DIR/"
[[ -d "$SOURCE_DIR/examples" ]] && cp -r "$SOURCE_DIR/examples" "$INSTALL_DIR/"

# ── Executable ────────────────────────────────────────────────────────────
info "Creating executable $BIN_DIR/nuba ..."
cat > "$BIN_DIR/nuba" << EXEC
#!/usr/bin/env bash
exec "$PYTHON" "$INSTALL_DIR/nuba_cli.py" "\$@"
EXEC
chmod +x "$BIN_DIR/nuba"

# ── .nu file association via macOS Launch Services ────────────────────────
info "Registering .nu file association..."

# Create a minimal .app bundle that handles .nu files
APP_BUNDLE="$INSTALL_DIR/Nuba.app"
CONTENTS="$APP_BUNDLE/Contents"
mkdir -p "$CONTENTS/MacOS" "$CONTENTS/Resources"

# Info.plist
cat > "$CONTENTS/Info.plist" << 'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
  "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>CFBundleName</key>           <string>Nuba</string>
  <key>CFBundleIdentifier</key>     <string>org.nuba-lang.Nuba</string>
  <key>CFBundleVersion</key>        <string>1.0.0</string>
  <key>CFBundleExecutable</key>     <string>nuba_open</string>
  <key>CFBundleDocumentTypes</key>
  <array>
    <dict>
      <key>CFBundleTypeExtensions</key>
      <array><string>nu</string></array>
      <key>CFBundleTypeRole</key>   <string>Editor</string>
      <key>CFBundleTypeName</key>   <string>Nuba Source File</string>
      <key>LSItemContentTypes</key>
      <array><string>org.nuba-lang.source</string></array>
    </dict>
  </array>
  <key>UTExportedTypeDeclarations</key>
  <array>
    <dict>
      <key>UTTypeIdentifier</key>       <string>org.nuba-lang.source</string>
      <key>UTTypeDescription</key>      <string>Nuba Source File</string>
      <key>UTTypeConformsTo</key>
      <array><string>public.source-code</string></array>
      <key>UTTypeTagSpecification</key>
      <dict>
        <key>public.filename-extension</key>
        <array><string>nu</string></array>
      </dict>
    </dict>
  </array>
</dict>
</plist>
PLIST

# Executable inside .app — opens a Terminal and runs the .nu file
cat > "$CONTENTS/MacOS/nuba_open" << APPEXEC
#!/usr/bin/env bash
# Open a Terminal window and run the .nu file
FILE="\$1"
osascript -e "tell application \"Terminal\"
  activate
  do script \"$PYTHON $INSTALL_DIR/nuba_cli.py '\$FILE'; echo 'Press Enter to close...'; read\"
end tell"
APPEXEC
chmod +x "$CONTENTS/MacOS/nuba_open"

# Register with Launch Services
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister \
    -f "$APP_BUNDLE" 2>/dev/null || warn "Could not register with Launch Services (non-fatal)"

success ".nu files associated with Nuba"

# ── Shell PATH ────────────────────────────────────────────────────────────
info "Configuring shell PATH..."
PATH_BLOCK="
# Nuba Programming Language
export PATH=\"$BIN_DIR:\$PATH\"
# End Nuba"

for RC in "$HOME/.zshrc" "$HOME/.bash_profile" "$HOME/.bashrc"; do
    if [[ -f "$RC" ]] && ! grep -q "Nuba Programming Language" "$RC" 2>/dev/null; then
        echo "$PATH_BLOCK" >> "$RC"
        info "  Updated $RC"
    fi
done

# ── Done ──────────────────────────────────────────────────────────────────
echo ""
echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════╗${RESET}"
echo -e "${GREEN}${BOLD}║      Nuba installed successfully!       ║${RESET}"
echo -e "${GREEN}${BOLD}╚══════════════════════════════════════════╝${RESET}"
echo ""
echo -e "  Executable:  ${BOLD}$BIN_DIR/nuba${RESET}"
echo -e "  Library:     ${BOLD}$INSTALL_DIR${RESET}"
echo ""
echo -e "  Next steps:"
echo -e "  1. Restart Terminal (or: source ~/.zshrc)"
echo -e "  2. ${BOLD}nuba --version${RESET}"
echo -e "  3. ${BOLD}nuba examples/hello.nu${RESET}"
echo -e "  4. Double-click any .nu file to run it!"
echo ""
