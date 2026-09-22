class Catchbox < Formula
  desc "Disposable inboxes for developers, with the code and the action link pulled out"
  homepage "https://github.com/brentc22/catchbox"
  url "https://github.com/brentc22/catchbox/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "b07825460b56cc1ec7c7c75715f43bef1d27009c583753c38264bde06acb1a9b"
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
