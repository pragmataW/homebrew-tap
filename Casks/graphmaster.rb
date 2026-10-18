cask "graphmaster" do
  version "0.1.1"
  name "graphmaster"
  desc "Code graph and search steering for AI coding agents"
  homepage "https://github.com/pragmataW/graphmaster"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "graphmaster"

  on_macos do
    on_intel do
      url "https://github.com/pragmataW/graphmaster/releases/download/v0.1.1/graphmaster_darwin_amd64.tar.gz"
      sha256 "12936840f35349da5ac5ca364d948c2b57cfcf35f50f74cc40d932cf70dbbd9f"
    end
    on_arm do
      url "https://github.com/pragmataW/graphmaster/releases/download/v0.1.1/graphmaster_darwin_arm64.tar.gz"
      sha256 "dedb9760a3e795e597373d399009886801de78167a600e5e8f74ffff26644550"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pragmataW/graphmaster/releases/download/v0.1.1/graphmaster_linux_amd64.tar.gz"
      sha256 "6d5b94d210b12d57cd2ddc5c93b5e5bde9d5ac53a4f0b9180c14b0f235e68967"
    end
    on_arm do
      url "https://github.com/pragmataW/graphmaster/releases/download/v0.1.1/graphmaster_linux_arm64.tar.gz"
      sha256 "4ee1576b6baadc5aa9e9d4bd5b504729f5570b68332141d48b05ada179a0f861"
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
