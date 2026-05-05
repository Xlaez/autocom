class Autocom < Formula
  desc "Lightweight git auto-commit watcher"
  homepage "https://github.com/xlaez/autocom"
  url "https://github.com/xlaez/autocom/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "943d3a986c0e37b445a85d72674f1a30c76b0e1123714b97298eb090d8d4b528"
  license "MIT"

  depends_on "ripgrep"

  def install
    bin.install "ac" => "autocom"
  end

  test do
    assert_match "autocom #{version}", shell_output("#{bin}/autocom --version")
  end
end
