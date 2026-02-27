class SportTui < Formula
  desc "Terminal UI for multi-sport data"
  homepage "https://github.com/christaylor19/sport-project"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/christaylor19/sport-project/releases/download/v0.2.0/sport-tui-aarch64-apple-darwin"
      sha256 "0d47882b081e6d3970ccc895d74833491ea23a3f50562fd3a9c534a7af9dca76"
    elsif Hardware::CPU.intel?
      url "https://github.com/christaylor19/sport-project/releases/download/v0.2.0/sport-tui-x86_64-apple-darwin"
      sha256 "6d5224c5ee227b91909f622db62ed6d83952fc444461b59bdf83c9e0ede0cee1"
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
