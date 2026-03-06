class SportTui < Formula
  desc "Terminal UI for multi-sport data"
  homepage "https://github.com/christaylor19/sport-project"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/christaylor19/sport-project/releases/download/v0.5.0/sport-tui-aarch64-apple-darwin"
      sha256 "87e790129731da1f3ebe3a9f5e6bcd7bfc1d4827d83fb615be7b9c5f79aeeb03"
    elsif Hardware::CPU.intel?
      url "https://github.com/christaylor19/sport-project/releases/download/v0.5.0/sport-tui-x86_64-apple-darwin"
      sha256 "7f1a363411595dd6ef67e5b7ec7e71c5299fa52c60cf8ea1b0dacb134d8ee505"
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
