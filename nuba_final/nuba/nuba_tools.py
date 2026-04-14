import os
import sys
import requests

# --- CONFIGURATION ---
# আপনার PythonAnywhere এর ডোমেইনটি এখানে দিন
API_BASE_URL = "https:// NUBA.pythonanywhere.com"

# প্যাকেজগুলো যেখানে সেভ হবে (Standard Nuba Directory)
INSTALL_DIR = "/usr/local/lib/nuba/nuba_final/nuba/nu-packages"

def nip_install(package_name):
    """
    NuPI সার্ভার থেকে প্যাকেজ ডাউনলোড করে 'nu-packages' ফোল্ডারে রাখে।
    ব্যবহার: nip install <package_name>
    """
    print(f"[*] nip: Searching for package '{package_name}' on NuPI...")
    
    # আপনার API-এর ডাউনলোড এন্ডপয়েন্ট কল করা
    url = f"{API_BASE_URL}/download/{package_name}"
    
    try:
        response = requests.get(url, stream=True)
        
        if response.status_code == 200:
            # প্যাকেজের জন্য নির্দিষ্ট ফোল্ডার তৈরি
            pkg_path = os.path.join(INSTALL_DIR, package_name)
            os.makedirs(pkg_path, exist_ok=True)
            
            # প্যাকেজ ফাইলটি সেভ করা (init হিসেবে যাতে ইম্পোর্ট সহজ হয়)
            file_to_save = os.path.join(pkg_path, f"{package_name}.nu")
            
            with open(file_to_save, "wb") as f:
                for chunk in response.iter_content(chunk_size=8192):
                    f.write(chunk)
            
            print(f"[✔] Successfully installed: {package_name}")
            print(f"[*] Location: {file_to_save}")
            
        elif response.status_code == 404:
            print(f"[✘] Error: Package '{package_name}' not found in the registry.")
        else
