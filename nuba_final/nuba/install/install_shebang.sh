#!/usr/bin/env bash
# install_shebang.sh
# Makes .nu files directly executable on Linux/macOS
# After running: chmod +x myscript.nu && ./myscript.nu
#
# This installs nuba into /usr/bin/env's path so:
#   #!/usr/bin/env nuba   works at the top of any .nu file

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Setting up shebang support for .nu files..."

# ── Find/create nuba binary ────────────────────────────────────────────────
if command -v nuba &>/dev/null; then
    echo "✓ nuba already on PATH: $(which nuba)"
else
    # Try to install
    echo "Installing nuba to PATH..."
    bash "$SCRIPT_DIR/install.sh"
fi

# ── Instruct user on shebang usage ────────────────────────────────────────
cat << 'GUIDE'

════════════════════════════════════════════════════════════
  Shebang support is now configured!

  Add this as the FIRST LINE of any .nu file:
  ────────────────────────────────────────────
  #!/usr/bin/env nuba
  ────────────────────────────────────────────

  Then make it executable:
    chmod +x myscript.nu

  Now run it directly:
    ./myscript.nu

  Example:
    cat > hello.nu << 'EOF'
    #!/usr/bin/env nuba
    print("Hello from Nuba!")
    EOF
    chmod +x hello.nu
    ./hello.nu

════════════════════════════════════════════════════════════
GUIDE
