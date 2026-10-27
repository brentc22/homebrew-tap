cask "glint" do
  version "0.4.0"
  sha256 "ee1de3235192cff48609053423fe0281e4099ae10053f7eefa88de932e318540"

  url "https://github.com/brentc22/glint/releases/download/v#{version}/Glint.zip"
  name "Glint"
  desc "Screenshot tool that blurs emails, IBANs, card numbers and API keys"
  homepage "https://github.com/brentc22/glint"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Glint.app"

  zap trash: "~/Library/Preferences/com.brentc22.Glint.plist"

  caveats <<~EOS
    Glint is ad-hoc signed and not notarised by Apple, so macOS will refuse to open
    it until the quarantine flag is cleared. After installing, run once:
      xattr -dr com.apple.quarantine /Applications/Glint.app

    On the first capture, allow Screen Recording in System Settings.
  EOS
end
