class Catchbox < Formula
  desc "Disposable inboxes for developers, with the code and the action link pulled out"
  homepage "https://github.com/brentc22/catchbox"
  url "https://github.com/brentc22/catchbox/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "6b775fcc99089781b214059479e4d83bff5b7ebc0f1aeb3ae7715c3b8e71d302"
  license "MIT"
  head "https://github.com/brentc22/catchbox.git", branch: "main"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    # The demo inbox is self-contained, so the test never reaches the network.
    assert_match "disposable inboxes", shell_output("#{bin}/catchbox help")
    assert_match "catchbox boxes", shell_output("#{bin}/testmail help")
  end
end
