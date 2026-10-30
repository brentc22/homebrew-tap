cask "clipt" do
  version "0.1.0"
  sha256 "1b8036954bfed1354662234913c5ac916dbe9c6cf49862825b87d8efdba7beb9"

  url "https://github.com/brentc22/clipt/releases/download/v#{version}/Clipt.zip"
  name "Clipt"
  desc "Clipboard history, one keystroke away"
  homepage "https://github.com/brentc22/clipt"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Clipt.app"

  zap trash: [
    "~/Library/Application Support/Clipt",
    "~/Library/Preferences/com.brentc22.Clipt.plist",
  ]

  caveats <<~EOS
    Clipt isn't notarized yet, so macOS blocks the first launch. Clear the quarantine flag:

      xattr -dr com.apple.quarantine /Applications/Clipt.app

    Then allow two permissions when Clipt asks:
      - Accessibility (System Settings > Privacy & Security), so it can paste for you.
      - Paste from Other Apps set to "Allow" (Privacy & Security), so it can see what you copy.
  EOS
end
