cask "pragma-ade" do
  arch arm: "arm64", intel: "x64"

  version "0.10.0"
  sha256 arm:   "88909180174e8b2b69c0397a0cba3285c56caf502819c2fa733d949d12055f40",
         intel: "8dcaa117c8c28d1c971481e4544e78b5bd59174428c5d9f1466a58a4cc6b64c4"

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
