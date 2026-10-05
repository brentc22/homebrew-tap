cask "catchbox" do
  version "1.4.0"
  sha256 "f708a0e38a447a1d7bb2f271d41d41d2a1cf33d260cb6b21919b8a17a89e245f"

  url "https://github.com/brentc22/catchbox/releases/download/v#{version}/Catchbox-#{version}.zip"
  name "catchbox"
  desc "Disposable inboxes for developers, with the code in your notifications"
  homepage "https://github.com/brentc22/catchbox"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app runs the same JavaScript as the catchbox command, so it needs a node.
  depends_on formula: "node"
  depends_on macos: :ventura

  app "Catchbox.app"

  # The mailboxes in ~/.config/testmail are shared with the catchbox formula and stay.
  zap trash: [
    "~/Library/Caches/com.brentc22.Catchbox",
    "~/Library/HTTPStorages/com.brentc22.Catchbox",
    "~/Library/Preferences/com.brentc22.Catchbox.plist",
    "~/Library/WebKit/com.brentc22.Catchbox",
  ]

  caveats <<~EOS
    catchbox is ad-hoc signed and not notarised by Apple, so macOS will refuse to open
    it until the quarantine flag is cleared. After installing or upgrading, run once:
      xattr -dr com.apple.quarantine /Applications/Catchbox.app
  EOS
end
