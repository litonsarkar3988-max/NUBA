import os
import sys
import requests

# --- CONFIGURATION ---
# আপনার PythonAnywhere ডোমেইন (এখানে স্পেস সরিয়ে সঠিক URL দিন)
API_BASE_URL = "https://NUBA.pythonanywhere.com"

# আপনার পিসিতে বা কোলাবে যেখানে ফাইল জমা হবে
INSTALL_DIR = "/usr/local/lib/nuba/nuba_final/nuba/nu-packages"

def nip_install(package_name):
    """
    PythonAnywhere সার্ভারের মাধ্যমে NuPI Repository থেকে প্যাকেজ ডাউনলোড করে।
    """
    print(f"[*] nip: Searching for package '{package_name}' on NuPI Repository...")
    
    url = f"{API_BASE_URL}/download/{package_name}"
    
    try:
        response = requests.get(url, stream=True)
        
        if response.status_code == 200:
            pkg_path = os.path.join(INSTALL_DIR, package_name)
            os.makedirs(pkg_path, exist_ok=True)
            
            file_to_save = os.path.join(pkg_path, f"{package_name}.nu")
            
            with open(file_to_save, "wb") as f:
                for chunk in response.iter_content(chunk_size=8192):
                    f.write(chunk)
            
            print(f"[✔] Successfully installed: {package_name}")
            print(f"[*] Path: {file_to_save}")
            
        elif response.status_code == 404:
            print(f"[✘] Error: Package '{package_name}' not found in NuPI/packages/.")
        else:
            print(f"[✘] Server Error: {response.status_code}")
            
    except Exception as e:
        print(f"[✘] Connection Failed: {e}")

def nin_publish(file_path):
    """
    ফাইলটি PythonAnywhere-এ পাঠায় যা সরাসরি NuPI/packages/ এ জমা হয়।
    """
    if not os.path.exists(file_path):
        print(f"[✘] Error: File '{file_path}' not found.")
        return

    if not file_path.endswith(".nu"):
        print("[✘] Error: Only .nu files can be published.")
        return

    filename = os.path.basename(file_path)
    print(f"[*] nin: Uploading '{filename}' to NuPI Repository...")
    
    try:
        with open(file_path, 'rb') as f:
            files = {'file': (filename, f)}
            response = requests.post(f"{API_BASE_URL}/publish", files=files)
            
            if response.status_code == 200:
                print(f"[✔] Success! '{filename}' is now live in NuPI/packages/.")
            else:
                print(f"[✘] Publication Failed: {response.text}")
                
    except Exception as e:
        print(f"[✘] Connection Error: {e}")

def main():
    if len(sys.argv) < 3:
        print("Usage: nip install <pkg> OR nin publish <file.nu>")
        sys.exit(1)

    command = sys.argv[1]
    target = sys.argv[2]

    if command == "install":
        nip_install(target)
    elif command == "publish":
        nin_publish(target)
    else:
        print(f"[✘] Unknown command: {command}")

if __name__ == "__main__":
    main()
