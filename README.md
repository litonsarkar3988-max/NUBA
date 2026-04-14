# 🚀 NUBA Language Ecosystem

![NUBA Logo](NUBA.JPG)

**NUBA** is a modern, high-performance, and user-friendly programming language ecosystem. It provides a complete suite for developers, integrating the Interpreter, Package Manager (**nuba install**), and Publisher (**nuba publish**) into a single, unified command-line interface.

---

## ✨ Key Features

* **All-in-One CLI:** Manage everything (running code, installing, and publishing) with just the `nuba` command.
* **NuPI Integration:** Seamlessly share and download libraries via the Nuba Package Index (NuPI).
* **Standard Library:** Built-in powerful modules for math, string manipulation, and I/O operations.
* **Invisible System:** All system files are tucked away in hidden paths, keeping your workspace clean and professional.
* **One-Click Setup:** Zero configuration required—get started with a single line of code.

---

## 🛠 Installation

Run the following command in your Colab notebook or Linux terminal to set up the full NUBA environment:

```bash
curl -sSL [https://raw.githubusercontent.com/litonsarkar3988-max/NUBA/main/install.sh](https://raw.githubusercontent.com/litonsarkar3988-max/NUBA/main/install.sh) | bash

Usage Guide
1. Running Your Code
To execute any .nu file:

Bash

nuba filename.nu
2. Installing Libraries (Powered by nip)
To download a package from the internet (NuPI):

Bash

nuba install <package_name>
3. Publishing Libraries (Powered by nin)
To share your own library with the community:

Bash

nuba publish <your_file.nu>
4. Learning & Documentation
Bash

nuba tutorial  # Learn the syntax and basics
nuba explain   # Understand the internal architecture

📁 Directory Structure (System Paths)
After installation, your system files are securely stored at:

Core Engine: /usr/local/bin/nuba

Standard Libs: /usr/local/lib/nuba/stdlib/

Packages: /usr/local/lib/nuba/packages/

🤝 Contribution
If you want to contribute to NUBA or create new packages, simply publish them to NuPI and help us grow the ecosystem!

Developed with ❤️ by Rahul
---

## ⚖️ License
This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for more details.
