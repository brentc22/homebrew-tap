cask "catchbox" do
  version "1.2.1"
  sha256 "4b2c9d6a1db4c59f367ae554c906a8cd2c64e1eeef7d06a9efc7dabb0615f131"

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
