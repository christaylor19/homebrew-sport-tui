class SportTui < Formula
  desc "Terminal UI for multi-sport data"
  homepage "https://github.com/christaylor19/sport-project"
  version "0.5.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/christaylor19/sport-project/releases/download/v0.5.4/sport-tui-aarch64-apple-darwin"
      sha256 "55b3c36c04490d3a1595604234ffbcfabb716cf25e60d058095454fdfcd1362d"
    elsif Hardware::CPU.intel?
      url "https://github.com/christaylor19/sport-project/releases/download/v0.5.4/sport-tui-x86_64-apple-darwin"
      sha256 "4d8eba169b235555c4e26d23bed7e4f6e6695b870bc070d4b14a1fb5d442be58"
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
