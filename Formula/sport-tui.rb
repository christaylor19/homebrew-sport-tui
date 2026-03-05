class SportTui < Formula
  desc "Terminal UI for multi-sport data"
  homepage "https://github.com/christaylor19/sport-project"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/christaylor19/sport-project/releases/download/v0.4.0/sport-tui-aarch64-apple-darwin"
      sha256 "0378c5d80eb92819e2d04ded9ea2b2fc5407e9fecd7876c0e4c91d55241245ff"
    elsif Hardware::CPU.intel?
      url "https://github.com/christaylor19/sport-project/releases/download/v0.4.0/sport-tui-x86_64-apple-darwin"
      sha256 "87a1a524050017cf5156b6c06a07dfce0270318ed0bf8ef3b439a4c9b942f80c"
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
