class SportTui < Formula
  desc "Terminal UI for multi-sport data"
  homepage "https://github.com/christaylor19/sport-project"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/christaylor19/sport-project/releases/download/v0.3.0/sport-tui-aarch64-apple-darwin"
      sha256 "402ecf0eca526f406896233e0711f29c3b85263df13b1a8c1a5f6b8e8c26d686"
    elsif Hardware::CPU.intel?
      url "https://github.com/christaylor19/sport-project/releases/download/v0.3.0/sport-tui-x86_64-apple-darwin"
      sha256 "7f2a50588f562f8cc8663519cd65e6722034d1befd8133a543aae3824c81ea58"
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
