class SportTui < Formula
  desc "Terminal UI for multi-sport data"
  homepage "https://github.com/christaylor19/sport-project"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/christaylor19/sport-project/releases/download/v0.6.0/sport-tui-aarch64-apple-darwin"
      sha256 "54ebcbf36ed3fc62e1b99291d51b1bccdb307b8ed1f9cdb4ff4f69f00694d0e5"
    elsif Hardware::CPU.intel?
      url "https://github.com/christaylor19/sport-project/releases/download/v0.6.0/sport-tui-x86_64-apple-darwin"
      sha256 "e0a50c9a71c6d189eac26165a4734c543494ff9992e6ed4858c8904d39a65d46"
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
