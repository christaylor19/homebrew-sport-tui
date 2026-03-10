class SportTui < Formula
  desc "Terminal UI for multi-sport data"
  homepage "https://github.com/christaylor19/sport-project"
  version "0.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/christaylor19/sport-project/releases/download/v0.5.3/sport-tui-aarch64-apple-darwin"
      sha256 "1254de611163133094a47a25a1c0b4efb7f501c44f2a31b8ce19ed0e9232389b"
    elsif Hardware::CPU.intel?
      url "https://github.com/christaylor19/sport-project/releases/download/v0.5.3/sport-tui-x86_64-apple-darwin"
      sha256 "9ae0bf32ad20c7a9d39c46668e71d0931666fec71f8593620e9b0e0e59ad0520"
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
