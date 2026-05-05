class Autocom < Formula
  desc "Lightweight git auto-commit watcher"
  homepage "https://github.com/xlaez/autocom"
  url "https://github.com/xlaez/autocom/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "09301d0b58a0151c2577cbee0f55210f0fd09e061e11ecadc78fb263c584abb0"
  license "MIT"

  depends_on "ripgrep"

  def install
    bin.install "ac" => "autocom"
  end

  test do
    assert_match "autocom #{version}", shell_output("#{bin}/autocom --version")
  end
end
