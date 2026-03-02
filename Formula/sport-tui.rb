class SportTui < Formula
  desc "Terminal UI for multi-sport data"
  homepage "https://github.com/christaylor19/sport-project"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/christaylor19/sport-project/releases/download/v0.3.1/sport-tui-aarch64-apple-darwin"
      sha256 "668418c12045b14c9f4253d91702be60c90a5fe070b674be51b7030e25c9badf"
    elsif Hardware::CPU.intel?
      url "https://github.com/christaylor19/sport-project/releases/download/v0.3.1/sport-tui-x86_64-apple-darwin"
      sha256 "fbb03798a87a6e9855a6096ddec059b2488366fd6fc76f0f9b898e573f8be74d"
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
