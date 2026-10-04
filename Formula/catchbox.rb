class Catchbox < Formula
  desc "Disposable inboxes for developers, with the code and the action link pulled out"
  homepage "https://github.com/brentc22/catchbox"
  url "https://github.com/brentc22/catchbox/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "d4403af087b0ed6d95929eb7521688c9840acecc3dbf6e96233a90c33e07da8d"
  license "MIT"
  head "https://github.com/brentc22/catchbox.git", branch: "main"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    # Both entry points exist, and each one names itself in its own help — a hint that
    # points at the other command is the kind of papercut nobody reports.
    assert_match "catchbox boxes", shell_output("#{bin}/catchbox help")
    assert_match "testmail boxes", shell_output("#{bin}/testmail help")
    assert_match "disposable inboxes", shell_output("#{bin}/catchbox help")
  end
end
