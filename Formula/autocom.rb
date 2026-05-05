class Autocom < Formula
  desc "Lightweight git auto-commit watcher"
  homepage "https://github.com/xlaez/autocom"
  url "https://github.com/xlaez/autocom/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "12fb1a47347f48a4afc2711b9d0b97a84cad4c4906ef3f8cda40db22ea25f1b8"
  license "MIT"

  depends_on "ripgrep"

  def install
    bin.install "ac" => "autocom"
  end

  test do
    assert_match "autocom #{version}", shell_output("#{bin}/autocom --version")
  end
end
