cask "portside" do
  version "0.3.0"
  sha256 "7bdc7e128c7a2e1b76be8378c8499d2ce0a9b73cc78281f27efeec86782ee973"

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
