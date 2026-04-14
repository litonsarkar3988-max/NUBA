#!/bin/bash
# =========================================================
# NUBA ECOSYSTEM INSTALLER v1.0
# Developed by: Rahul (NUBA Dev Team)
# =========================================================

echo "[*] Starting NUBA Installation..."

# ১. সিস্টেম ডিরেক্টরি তৈরি করা (এগুলো সাধারণত ফাইল ব্রাউজারে দেখা যায় না)
BASE_DIR="/usr/local/lib/nuba"
sudo mkdir -p $BASE_DIR/stdlib    # কোর লাইব্রেরি
sudo mkdir -p $BASE_DIR/packages  # ডাউনলোড করা প্যাকেজ (NuPI)
sudo mkdir -p $BASE_DIR/docs      # টিউটোরিয়াল ও এক্সপ্লানেশন
sudo mkdir -p $BASE_DIR/tests     # সিস্টেম টেস্ট ফাইল

# ২. মেইন nuba.py (Interprete/Manager) ডাউনলোড করা
# এটি সরাসরি গ্লোবাল বিন-এ যাবে যাতে 'nuba' কমান্ড কাজ করে
echo "[*] Installing NUBA Core Engine..."
sudo curl -sSL "https://raw.githubusercontent.com/litonsarkar3988-max/NUBA/main/nuba.py" -o /usr/local/bin/nuba
sudo chmod +x /usr/local/bin/nuba

# ৩. স্ট্যান্ডার্ড লাইব্রেরি (Standard Libraries) ডাউনলোড
echo "[*] Syncing Standard Libraries..."
# আপনার stdlib ফোল্ডারের ফাইলগুলোর লিস্ট এখানে দিন
STD_LIBS=("math.nu" "string.nu" "io.nu" "system.nu")
for lib in "${STD_LIBS[@]}"; do
    sudo curl -sSL "https://raw.githubusercontent.com/litonsarkar3988-max/NUBA/main/stdlib/$lib" -o "$BASE_DIR/stdlib/$lib"
done

# ৪. ডকুমেন্টেশন এবং টিউটোরিয়াল ডাউনলোড
echo "[*] Fetching Tutorials and Documentation..."
sudo curl -sSL "https://raw.githubusercontent.com/litonsarkar3988-max/NUBA/main/docs/tutorial.txt" -o "$BASE_DIR/docs/tutorial.txt"
sudo curl -sSL "https://raw.githubusercontent.com/litonsarkar3988-max/NUBA/main/docs/explain.txt" -o "$BASE_DIR/docs/explain.txt"

# ৫. ইন্টারনাল টেস্ট ফাইল ডাউনলোড
echo "[*] Setting up System Tests..."
sudo curl -sSL "https://raw.githubusercontent.com/litonsarkar3988-max/NUBA/main/tests/test_core.nu" -o "$BASE_DIR/tests/test_core.nu"

# ৬. পারমিশন নিশ্চিত করা
sudo chmod -R 755 $BASE_DIR

echo "------------------------------------------------"
echo "   [✔] NUBA Installation Successful!            "
echo "------------------------------------------------"
echo "Commands to try:"
echo "  nuba <file.nu>       - Run your code"
echo "  nuba tutorial        - Learn NUBA syntax"
echo "  nuba explain         - How NUBA works"
echo "  nuba install <pkg>   - Get libraries from NuPI"
echo "  nuba publish <file>  - Upload to NuPI"
echo "------------------------------------------------"
