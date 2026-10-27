cask "portside" do
  version "0.2.0"
  sha256 "9bf9b542296d996aa47562910f74d1c54b1018b058eea579ea0f14482f24014d"

  url "https://github.com/brentc22/portside/releases/download/v#{version}/Portside.zip"
  name "Portside"
  desc "Menu bar list of dev servers, grouped by repo and git worktree"
  homepage "https://github.com/brentc22/portside"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Portside.app"

  zap trash: "~/Library/Preferences/com.brentc22.Portside.plist"

  caveats <<~EOS
    Portside is ad-hoc signed and not notarised by Apple, so macOS will refuse to open
    it until the quarantine flag is cleared. After installing, run once:
      xattr -dr com.apple.quarantine /Applications/Portside.app
  EOS
end
