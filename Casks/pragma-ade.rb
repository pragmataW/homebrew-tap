cask "pragma-ade" do
  arch arm: "arm64", intel: "x64"

  version "0.11.0"
  sha256 arm:   "7cad6ce7190f7a1531a4b14f7715a1914576b3e19a7a08facef93aa298f2eb29",
         intel: "d3f8a2ac36d36cc724cdc93d4b9fbb83a8135c8eefb02ab679e1978d9ed9929c"

  url "https://github.com/pragmataW/pragma-ade/releases/download/v#{version}/pragma-ade-#{version}-mac-#{arch}.zip"
  name "Pragma ADE"
  desc "Agentic development environment for Claude Code and OpenCode"
  homepage "https://github.com/pragmataW/pragma-ade"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Pragma ADE.app"

  postflight_steps do
    # The app is ad-hoc signed and not notarized; drop the quarantine flag so
    # Gatekeeper does not refuse the first launch.
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Pragma ADE.app"],
        must_succeed:   false,
        writable_paths: ["{{appdir}}/Pragma ADE.app"]
  end

  zap trash: [
    "~/Library/Application Support/Pragma ADE",
    "~/Library/Caches/dev.pragma.ade",
    "~/Library/Caches/dev.pragma.ade.ShipIt",
    "~/Library/HTTPStorages/dev.pragma.ade",
    "~/Library/Logs/Pragma ADE",
    "~/Library/Preferences/dev.pragma.ade.plist",
    "~/Library/Saved Application State/dev.pragma.ade.savedState",
  ]

  caveats <<~EOS
    Pragma ADE is not signed with an Apple Developer ID or notarized.
    The cask removes the quarantine flag after install. If macOS still blocks it, run:
      xattr -dr com.apple.quarantine "#{appdir}/Pragma ADE.app"

    Pragma ADE drives the agent CLIs already on your machine: install Claude Code
    and/or OpenCode 2.x, and git, separately.
  EOS
end
