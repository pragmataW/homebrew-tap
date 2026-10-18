cask "graphmaster" do
  version "0.1.0"
  name "graphmaster"
  desc "Code graph and search steering for AI coding agents"
  homepage "https://github.com/pragmataW/graphmaster"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "graphmaster"

  on_macos do
    on_intel do
      url "https://github.com/pragmataW/graphmaster/releases/download/v0.1.0/graphmaster_darwin_amd64.tar.gz"
      sha256 "0be61cdff5621c6acc80b87531db3181752793a82aa27ca159b8381213dafaab"
    end
    on_arm do
      url "https://github.com/pragmataW/graphmaster/releases/download/v0.1.0/graphmaster_darwin_arm64.tar.gz"
      sha256 "74713a2726c679860332ed2585b4f85106293e57a2afadff132c39ba2cc5f732"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pragmataW/graphmaster/releases/download/v0.1.0/graphmaster_linux_amd64.tar.gz"
      sha256 "e914faf015ba6490050b7c314a9a67e6ae4dea7f433496af6722a41379905a1e"
    end
    on_arm do
      url "https://github.com/pragmataW/graphmaster/releases/download/v0.1.0/graphmaster_linux_arm64.tar.gz"
      sha256 "47d5f82c10ed0a2f4debf6dcb208c931f5771094ae698c6ef1dce7c8cca2405b"
    end
  end

  postflight do
    # The binaries are not notarized; drop the quarantine flag so
    # Gatekeeper does not block the first run.
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/graphmaster"]
    end
  end

  caveats do
    "Run `graphmaster install` once to register graphmaster with your AI agents."
  end
end
