#!/usr/bin/env python3
import os
import sys
import requests
import shutil
import json
import base64

# --- CONFIGURATION (System Paths) ---
API_BASE_URL = "https://NUBA.pythonanywhere.com"
BASE_DIR = "/usr/local/lib/nuba"
STDLIB_DIR = os.path.join(BASE_DIR, "stdlib")    # Built-in libs
PACKAGE_DIR = os.path.join(BASE_DIR, "packages") # External packages from NuPI
DOCS_DIR = os.path.join(BASE_DIR, "docs")        # Tutorials & Explanations

# --- 1. SMART INSTALLER (GitHub Zip Support) ---
def nuba_install(package_name):
    print(f"[*] NuPI: Fetching '{package_name}'...")
    url = f"{API_BASE_URL}/download/{package_name}"
    
    try:
        response = requests.get(url, stream=True)
        if response.status_code == 200:
            target_path = os.path.join(PACKAGE_DIR, package_name)
            os.makedirs(target_path, exist_ok=True)
            
            zip_path = os.path.join(PACKAGE_DIR, f"{package_name}_temp.zip")
            with open(zip_path, "wb") as f:
                f.write(response.content)
            
            # Extracting Zip (Since GitHub provides ZIPs)
            try:
                shutil.unpack_archive(zip_path, target_path)
                os.remove(zip_path)
                print(f"[✔] Successfully installed: {package_name}")
            except Exception as e:
                # If it was a single .nu file instead of a zip
                os.rename(zip_path, os.path.join(target_path, f"{package_name}.nu"))
                print(f"[✔] Installed single file: {package_name}.nu")
        else:
            print(f"[✘] Package '{package_name}' not found on NuPI Index.")
    except Exception as e:
        print(f"[✘] Connection Error: {e}")

# --- 2. GITHUB PUBLISHER (Link-based) ---
def nuba_publish(repo_url):
    """Links a GitHub Repo to NuPI Index"""
    if not repo_url.startswith("https://github.com/"):
        print("[✘] Error: Invalid GitHub URL. Please provide a full Repo link.")
        return
    
    package_name = repo_url.rstrip('/').split("/")[-1].replace(".git", "")
    print(f"[*] NuPI: Linking GitHub repo '{package_name}'...")
    
    try:
        payload = {
            'repo_url': repo_url,
            'package_name': package_name
        }
        r = requests.post(f"{API_BASE_URL}/publish_github", json=payload)
        
        if r.status_code == 200:
            print(f"[✔] Success! '{package_name}' is now live on NuPI via GitHub.")
        else:
            print(f"[✘] Publication Failed: {r.json().get('msg', 'Unknown Error')}")
    except Exception as e:
        print(f"[✘] Server Crash: {e}")

# --- 3. PATH-AWARE INTERPRETER ---
def run_nuba(target_file):
    # পাথ খোঁজার প্রায়োরিটি লজিক
    search_paths = [
        target_file, # Local
        os.path.join(STDLIB_DIR, target_file), # Standard Lib
        os.path.join(PACKAGE_DIR, target_file.split('.')[0], target_file), # Package folder
        os.path.join(PACKAGE_DIR, target_file.replace('.nu',''), target_file) # Alt folder
    ]
    
    found_path = None
    for p in search_paths:
        if os.path.exists(p):
            found_path = p
            break
            
    if found_path:
        with open(found_path, 'r') as f:
            content = f.read()
            print(f"--- Executing NUBA: {found_path} ---")
            # ------------------------------------------------
            # এখানে তোমার আসল ইন্টারপ্রিটার লজিক বা বাইনারি কল হবে
            print(content) 
            # ------------------------------------------------
    else:
        print(f"[✘] Error: Could not find '{target_file}' in local, stdlib, or packages.")

# --- 4. DOCUMENTATION SYSTEM ---
def show_docs(doc_type):
    path = os.path.join(DOCS_DIR, f"{doc_type}.txt")
    if os.path.exists(path):
        print(f"--- NUBA {doc_type.upper()} ---")
        print(open(path).read())
    else:
        print(f"[✘] {doc_type.capitalize()} info not found. Did you run install.sh?")

# --- 5. MAIN CLI ROUTER ---
def main():
    if len(sys.argv) < 2:
        print("NUBA Ultra Engine v1.0")
        print("Usage:")
        print("  nuba <file.nu>           : Run script")
        print("  nuba install <pkg>       : Install library from NuPI")
        print("  nuba publish <repo_url>  : Link your GitHub repo to NuPI")
        print("  nuba tutorial            : Show syntax guide")
        sys.exit(1)

    cmd = sys.argv[1]

    if cmd == "install" and len(sys.argv) > 2:
        nuba_install(sys.argv[2])
    elif cmd == "publish" and len(sys.argv) > 2:
        nuba_publish(sys.argv[2])
    elif cmd in ["tutorial", "explain"]:
        show_docs(cmd)
    elif cmd == "test":
        run_nuba(os.path.join(BASE_DIR, "tests", "test_core.nu"))
    else:
        # সরাসরি ফাইল রান করা (e.g. nuba main.nu)
        target = sys.argv[2] if cmd == "run" and len(sys.argv) > 2 else sys.argv[1]
        run_nuba(target)

if __name__ == "__main__":
    main()
