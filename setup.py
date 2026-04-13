import os
import shutil
import sys

def install_nuba():
    # ১. পাথ সেটআপ
    current_dir = os.path.dirname(os.path.abspath(__file__))
    
    # সিস্টেম লোকেশন (প্রফেশনাল স্ট্যান্ডার্ড)
    LIB_INSTALL_PATH = "/usr/local/lib/nuba"
    BIN_PATH = "/usr/local/bin"

    print("--- Nuba Language Installation Started ---")

    try:
        # ২. ডিরেক্টরি তৈরি করা
        if not os.path.exists(LIB_INSTALL_PATH):
            os.makedirs(LIB_INSTALL_PATH)
            print(f"[✔] Created library directory at {LIB_INSTALL_PATH}")

        # ৩. সব ফাইল সিস্টেম লাইব্রেরিতে কপি করা (আপনার ৬০০০ ফাইল সহ)
        print("[*] Copying core files and standard libraries... This may take a moment.")
        # এখানে 'nuba_final' বা আপনার মেইন সোর্স ফোল্ডারের নাম দিন
        source_nuba = os.path.join(current_dir, "nuba_final") 
        
        if os.path.exists(source_nuba):
            # পুরনো থাকলে মুছে নতুন করে কপি করা
            if os.path.exists(os.path.join(LIB_INSTALL_PATH, "nuba_final")):
                shutil.rmtree(os.path.join(LIB_INSTALL_PATH, "nuba_final"))
            shutil.copytree(source_nuba, os.path.join(LIB_INSTALL_PATH, "nuba_final"))
            print(f"[✔] Successfully copied all 6000+ files to {LIB_INSTALL_PATH}")
        else:
            print("[✘] Error: 'nuba_final' folder not found in current directory.")
            return

        # ৪. কমান্ডগুলো (nuba, nip, nin) বিন-এ সেট করা
        cli_path = os.path.join(LIB_INSTALL_PATH, "nuba_final/nuba/nuba_cli.py")
        tools_path = os.path.join(LIB_INSTALL_PATH, "nuba_final/nuba/nuba_tools.py")

        commands = {
            "nuba": f'python3 {cli_path} "$@"',
            "nip": f'python3 {tools_path} install "$@"',
            "nin": f'python3 {tools_path} publish "$@"'
        }

        for cmd, logic in commands.items():
            cmd_file = os.path.join(BIN_PATH, cmd)
            with open(cmd_file, "w") as f:
                f.write("#!/bin/bash\n")
                f.write(logic + "\n")
            
            os.chmod(cmd_file, 0o755) # এক্সিকিউটেবল পারমিশন
            print(f"[✔] Command '{cmd}' is now global.")

    except PermissionError:
        print("\n[✘] Error: Please run this script with 'sudo'.")
        print("Example: sudo python3 setup.py")
        return
    except Exception as e:
        print(f"[✘] An unexpected error occurred: {e}")
        return

    print("-------------------------------------------")
    print("Nuba is successfully installed globally!")
    print("Try: 'nuba --version', 'nip install math', or 'nin publish'")

if __name__ == "__main__":
    install_nuba()
