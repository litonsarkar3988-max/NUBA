#!/bin/bash
# =========================================================
# NUBA ECOSYSTEM INSTALLER v1.1 (Termux & Linux Support)
# =========================================================

echo "[*] Starting NUBA Installation..."

# ১. এনভায়রনমেন্ট ডিটেকশন (Termux vs Linux)
if [ -d "$PREFIX/bin" ]; then
    # এটি টার্মিনাক্স (Termux)
    BIN_DIR="$PREFIX/bin"
    BASE_DIR="$HOME/.nuba"
    SUDO=""
    echo "[!] Termux environment detected."
else
    # এটি সাধারণ লিনাক্স বা কোলাব
    BIN_DIR="/usr/local/bin"
    BASE_DIR="/usr/local/lib/nuba"
    SUDO="sudo"
    echo "[!] Linux environment detected."
fi

# ২. ডিরেক্টরি তৈরি করা (sudo ছাড়াই যদি টার্মিনাক্স হয়)
$SUDO mkdir -p $BASE_DIR/stdlib
$SUDO mkdir -p $BASE_DIR/packages
$SUDO mkdir -p $BASE_DIR/docs
$SUDO mkdir -p $BASE_DIR/tests

# ৩. মেইন nuba.py ডাউনলোড
echo "[*] Installing NUBA Core Engine..."
$SUDO curl -sSL "https://raw.githubusercontent.com/litonsarkar3988-max/NUBA/main/nuba.py" -o $BIN_DIR/nuba
$SUDO chmod +x $BIN_DIR/nuba

# ৪. স্ট্যান্ডার্ড লাইব্রেরি ডাউনলোড
echo "[*] Syncing Standard Libraries..."
STD_LIBS=("math.nu" "string.nu" "io.nu" "system.nu")
for lib in "${STD_LIBS[@]}"; do
    $SUDO curl -sSL "https://raw.githubusercontent.com/litonsarkar3988-max/NUBA/main/stdlib/$lib" -o "$BASE_DIR/stdlib/$lib"
done

# ৫. ডকুমেন্টেশন এবং টেস্ট ফাইল
$SUDO curl -sSL "https://raw.githubusercontent.com/litonsarkar3988-max/NUBA/main/docs/tutorial.txt" -o "$BASE_DIR/docs/tutorial.txt"
$SUDO curl -sSL "https://raw.githubusercontent.com/litonsarkar3988-max/NUBA/main/tests/test_core.nu" -o "$BASE_DIR/tests/test_core.nu"

# ৬. পারমিশন নিশ্চিত করা
$SUDO chmod -R 755 $BASE_DIR

echo "------------------------------------------------"
echo "   [✔] NUBA Installation Successful!            "
echo "------------------------------------------------"
echo "Try running: nuba tutorial"
