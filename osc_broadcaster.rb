# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class OscBroadcaster < Formula
  desc "OSC (Open Sound Control) broadcast server that can be started from the command line."
  homepage "https://osc-broadcaster.enkatsu.org/"
  url "https://github.com/enkatsu/osc_broadcaster/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "bad0539d635c2bd2f9617949251c0dd4e229bd0267344abb7f267dccaa8ebee4"
  license "MIT"
  depends_on "rustup-init" => :build

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    print buildpath
    system "rustup-init"
    ENV["GOPATH"] = buildpath
    osc_broadcaster_path = buildpath/"src/github.com/enkatsu/osc_broadcaster/"
    cd osc_broadcaster_path do
      system "cargo", "build", "--release"
      bin.install "./target/release/osc_broadcaster"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test osc_broadcaster`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    # system "false"
  end
end
