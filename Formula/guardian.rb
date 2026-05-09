class Guardian < Formula
  desc "Lock input, prevent sleep, keep agents running"
  homepage "https://github.com/kilogramirisok/guardian"
  url "https://github.com/kilogramirisok/guardian/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PLACEHOLDER_UPDATE_ON_RELEASE"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/guardian"
  end

  test do
    assert_match "lock", shell_output("#{bin}/guardian --help")
  end
end
