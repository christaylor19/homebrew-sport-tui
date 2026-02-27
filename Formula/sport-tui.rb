class SportTui < Formula
  desc "Terminal UI for multi-sport data"
  homepage "https://github.com/christaylor19/sport-project"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/christaylor19/sport-project/releases/download/v0.1.0/sport-tui-aarch64-apple-darwin"
      sha256 "ddf211266ca2481b63cf9538e2099dee3691d61cf42e2f358e96764c779267cc"
    elsif Hardware::CPU.intel?
      url "https://github.com/christaylor19/sport-project/releases/download/v0.1.0/sport-tui-x86_64-apple-darwin"
      sha256 "1bed2e1cdd39e6274a1b5674fc98fbbe6d5413aa65bdd5c7ecb4aba7b047e56a"
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
