cask "catchbox" do
  version "1.3.0"
  sha256 "8bd10ee75f2131e8091d8b4601c08c74aca682da4d2996e923fbac2c9fadf0ae"

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
