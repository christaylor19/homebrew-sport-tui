class SportTui < Formula
  desc "Terminal UI for multi-sport data"
  homepage "https://github.com/christaylor19/sport-project"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/christaylor19/sport-project/releases/download/v0.5.2/sport-tui-aarch64-apple-darwin"
      sha256 "f1d53b43024141ced747d5df6f13ac3eea49fab96e3a63bffa0b1af2bff8a916"
    elsif Hardware::CPU.intel?
      url "https://github.com/christaylor19/sport-project/releases/download/v0.5.2/sport-tui-x86_64-apple-darwin"
      sha256 "e6671596ef993ac565477207594de29de0a04b112db6b61ed6bd6cb7dad8814e"
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
