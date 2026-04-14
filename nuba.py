import os
import sys
import requests
import base64

# --- কনফিগারেশন (সিস্টেম পাথ) ---
API_BASE_URL = "https://nuba.pythonanywhere.com"
BASE_DIR = "/usr/local/lib/nuba"
STDLIB_DIR = os.path.join(BASE_DIR, "stdlib")    # আগে থেকে থাকা কোর লাইব্রেরি
PACKAGE_DIR = os.path.join(BASE_DIR, "packages")  # NuPI থেকে ডাউনলোড করা প্যাকেজ
DOCS_DIR = os.path.join(BASE_DIR, "docs")        # টিউটোরিয়াল ও এক্সপ্লানেশন

# ১. প্যাকেজ ইনস্টল লজিক (nip)
def nip_install(package_name):
    print(f"[*] NuPI: Installing package '{package_name}'...")
    url = f"{API_BASE_URL}/download/{package_name}"
    try:
        response = requests.get(url, stream=True)
        if response.status_code == 200:
            target_path = os.path.join(PACKAGE_DIR, package_name)
            os.makedirs(target_path, exist_ok=True)
            with open(os.path.join(target_path, f"{package_name}.nu"), "wb") as f:
                f.write(response.content)
            print(f"[✔] Successfully installed: {package_name}")
        else:
            print(f"[✘] Package '{package_name}' not found on server.")
    except Exception as e:
        print(f"[✘] Connection Error: {e}")

# ২. প্যাকেজ পাবলিশ লজিক (nin)
def nin_publish(file_path):
    if not os.path.exists(file_path):
        print(f"[✘] Error: File '{file_path}' not found.")
        return
    filename = os.path.basename(file_path)
    print(f"[*] NuPI: Uploading '{filename}' to repository...")
    try:
        with open(file_path, 'rb') as f:
            files = {'file': (filename, f)}
            r = requests.post(f"{API_BASE_URL}/publish", files=files)
            if r.status_code == 200:
                print(f"[✔] Success! '{filename}' is now public on NuPI.")
            else:
                print(f"[✘] Publication Failed: {r.text}")
    except Exception as e:
        print(f"[✘] Server Crash: {e}")

# ৩. ইন্টারপ্রিটার ও পাথ সার্চিং লজিক
def run_nuba(target_file):
    # পাথ খোঁজার সিরিয়াল: ১. লোকাল ২. স্ট্যান্ডার্ড লাইব্রেরি ৩. প্যাকেজ ফোল্ডার
    search_paths = [
        target_file,
        os.path.join(STDLIB_DIR, target_file),
        os.path.join(PACKAGE_DIR, target_file.split('.')[0], target_file)
    ]
    
    found_path = None
    for p in search_paths:
        if os.path.exists(p):
            found_path = p
            break
            
    if found_path:
        with open(found_path, 'r') as f:
            content = f.read()
            # --- আপনার ইন্টারপ্রিটার কোর এখানে ---
            print(f"--- Running: {found_path} ---")
            # এখানে আপনার আসল নুবা এক্সিকিউশন লজিক বসবে
            print(content) 
            # ----------------------------------
    else:
        print(f"[✘] Error: '{target_file}' not found in any directory.")

# ৪. ডকুমেন্টেশন হ্যান্ডলার (Explain, Tutorial)
def show_docs(doc_type):
    path = os.path.join(DOCS_DIR, f"{doc_type}.txt")
    if os.path.exists(path):
        print(f"--- NUBA {doc_type.upper()} ---")
        print(open(path).read())
    else:
        print(f"[✘] {doc_type.capitalize()} documentation missing.")

# ৫. মেইন কমান্ড রাউটার
def main():
    if len(sys.argv) < 2:
        print("Usage:\n  nuba <file.nu>         : Run code\n  nuba install <pkg>     : Install library\n  nuba publish <file.nu> : Upload library\n  nuba tutorial          : Learn syntax\n  nuba explain           : How it works")
        sys.exit(1)

    cmd = sys.argv[1]

    if cmd == "install" and len(sys.argv) > 2:
        nip_install(sys.argv[2])
    elif cmd == "publish" and len(sys.argv) > 2:
        nin_publish(sys.argv[2])
    elif cmd in ["tutorial", "explain"]:
        show_docs(cmd)
    elif cmd == "test":
        # ইন্টারনাল টেস্ট সিস্টেম
        run_nuba(os.path.join(BASE_DIR, "tests", "test_core.nu"))
    else:
        # সরাসরি ফাইল রান করা (e.g., nuba main.nu)
        target = sys.argv[2] if cmd == "run" and len(sys.argv) > 2 else sys.argv[1]
        run_nuba(target)

if __name__ == "__main__":
    main()
