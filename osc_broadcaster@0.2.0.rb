class OscBroadcaster < Formula
  desc "Open Sound Control broadcast server that can be started from the command-line"
  homepage "https://osc-broadcaster.enkatsu.org/"
  url "https://github.com/enkatsu/osc_broadcaster.git", tag: "v0.2.0", revision: "f25ad4c7add8f55e1f67ff8b2421839130bdd197"
  license "MIT"
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "osc_broadcaster #{version}", shell_output("#{bin}/osc_broadcaster -V")
  end
end
