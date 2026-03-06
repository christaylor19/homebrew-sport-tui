class SportTui < Formula
  desc "Terminal UI for multi-sport data"
  homepage "https://github.com/christaylor19/sport-project"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/christaylor19/sport-project/releases/download/v0.5.1/sport-tui-aarch64-apple-darwin"
      sha256 "816908c3f093cecadda2e5b4999f4490e83f67732f2997b2066ad3affbb3942d"
    elsif Hardware::CPU.intel?
      url "https://github.com/christaylor19/sport-project/releases/download/v0.5.1/sport-tui-x86_64-apple-darwin"
      sha256 "b048b543520f705f9ba61800d6e49672c35221ac746240ac8e246478e3b41f6e"
    end
  end

  def install
    binary_name = if Hardware::CPU.arm?
      "sport-tui-aarch64-apple-darwin"
    else
      "sport-tui-x86_64-apple-darwin"
    end
    bin.install binary_name => "sport-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sport-tui --version")
  end
end
