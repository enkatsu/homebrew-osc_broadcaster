class OscBroadcaster < Formula
  desc "Open Sound Control broadcast server that can be started from the command-line"
  homepage "https://osc-broadcaster.enkatsu.org/"
  url "https://github.com/enkatsu/osc_broadcaster.git", tag: "v0.2.1", revision: "f21e0049fe3f98f1944169ce7d283677c42d29d9"
  license "MIT"
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "osc_broadcaster #{version}", shell_output("#{bin}/osc_broadcaster -V")
  end
end
