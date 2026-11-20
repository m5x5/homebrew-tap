cask "prototypie" do
  version "0.1.0"
  sha256 "3cbfd20f2f44e8cb64a7cc96c6e07e75d6e569a2cd6fd1210158a5e5d7457aa6"

  url "https://github.com/m5x5/prototypie/releases/download/v#{version}/Prototypie-#{version}-macos-arm64.dmg"
  name "Prototypie"
  desc "Design canvas for AI-generated prototypes"
  homepage "https://github.com/m5x5/prototypie"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Prototypie.app"
  binary "#{appdir}/Prototypie.app/Contents/MacOS/prototypie"

  # The app is ad hoc signed and not notarized; clear the download quarantine so it opens without a Gatekeeper prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Prototypie.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Prototypie",
    "~/Library/Caches/dev.prototypie.app",
    "~/Library/Preferences/dev.prototypie.app.plist",
  ]
end
