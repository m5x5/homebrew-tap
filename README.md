# Homebrew tap for Prototypie

```sh
brew install --cask m5x5/tap/prototypie
brew upgrade --cask prototypie      # update later
```

Apple Silicon Macs only. The app is [Prototypie](https://github.com/m5x5/prototypie); the cask installs the DMG from its
GitHub release and also links the `prototypie` command into your PATH. The app is not notarized, so the cask removes
the download quarantine flag after installing.

The cask is updated automatically: a scheduled workflow checks the latest release and commits the new version and
checksum.
