class Ac < Formula
  desc "Lightweight git auto-commit watcher"
  homepage "https://github.com/xlaez/autocom"
  url "https://github.com/xlaez/autocom/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_WITH_RELEASE_TARBALL_SHA256"
  license "MIT"

  depends_on "ripgrep"

  def install
    bin.install "ac"
  end

  test do
    assert_match "ac #{version}", shell_output("#{bin}/ac --version")
  end
end
