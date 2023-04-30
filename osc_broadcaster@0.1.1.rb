class OscBroadcaster < Formula
  desc "Open Sound Control broadcast server that can be started from the command-line"
  homepage "https://osc-broadcaster.enkatsu.org/"
  url "https://github.com/enkatsu/osc_broadcaster.git", tag: "v0.1.1", revision: "aae5aa3ef3f42c0416ad43cd3a0b697a45158d5e"
  license "MIT"
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "osc_broadcaster #{version}", shell_output("#{bin}/osc_broadcaster -V")
  end
end
