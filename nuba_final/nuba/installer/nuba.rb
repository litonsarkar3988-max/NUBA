class Nuba < Formula
  desc "Nuba Programming Language — run .nu files like Python"
  homepage "https://nuba-lang.org"
  url "https://github.com/nuba-lang/nuba/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "placeholder_sha256_replace_on_release"
  license "MIT"
  version "1.0.0"

  depends_on "python@3.11"

  def install
    python = Formula["python@3.11"].opt_bin/"python3"

    # Install library files
    libexec.install "nuba", "stdlib", "nuba_cli.py"
    libexec.install "examples" if File.directory?("examples")

    # Create executable wrapper
    (bin/"nuba").write <<~EOS
      #!/bin/bash
      exec "#{python}" "#{libexec}/nuba_cli.py" "$@"
    EOS
    chmod 0755, bin/"nuba"
  end

  def post_install
    # Register .nu MIME type on macOS
    app_bundle = libexec/"Nuba.app"
    app_bundle.mkpath
    (app_bundle/"Contents").mkpath
    (app_bundle/"Contents/MacOS").mkpath

    (app_bundle/"Contents/Info.plist").write <<~PLIST
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
          </dict>
        </array>
      </dict>
      </plist>
    PLIST

    (app_bundle/"Contents/MacOS/nuba_open").write <<~EOS
      #!/bin/bash
      open -a Terminal "#{bin}/nuba" "$@"
    EOS
    chmod 0755, app_bundle/"Contents/MacOS/nuba_open"

    system "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister",
           "-f", app_bundle.to_s rescue nil
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/nuba --version")
    assert_match "Hello", shell_output("#{bin}/nuba -c 'print(\"Hello\")'")
  end
end
