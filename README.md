# pragmataW/homebrew-tap

Homebrew tap for pragmataW's tools.

## graphmaster

[graphmaster](https://github.com/pragmataW/graphmaster) is an always-fresh local code graph for AI coding agents.

```sh
brew install pragmataW/tap/graphmaster
graphmaster install
```

Casks are updated by the graphmaster release pipeline.

## Pragma ADE

[Pragma ADE](https://github.com/pragmataW/pragma-ade) is an agentic development environment for Claude Code and
OpenCode (macOS arm64 and x64).

```sh
brew tap pragmataW/tap
brew trust pragmataW/tap   # Homebrew 7+ asks you to trust a third-party tap once
brew install --cask pragmataW/tap/pragma-ade
```

The app is not notarized; the cask clears the quarantine flag after install.
