class Frostscribe < Formula
  desc "Native macOS disc ripping and encoding tool for Jellyfin, Plex, and Kodi"
  homepage "https://github.com/trevholliday/frostscribe"
  url "https://github.com/trevholliday/frostscribe/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2388429ff57bf44d16c81d353164a5bbe1cf5814d3567ad96f921bbcb2a6c47f"
  version "0.1.0"
  license "MIT"

  depends_on :macos => :sonoma
  depends_on "handbrake" => :recommended

  def install
    system "swift", "build", "-c", "release",
           "--product", "frostscribe",
           "--product", "frostscribe-worker"
    bin.install ".build/release/frostscribe"
    bin.install ".build/release/frostscribe-worker"
  end

  def caveats
    <<~EOS
      MakeMKV is required for disc ripping. Download and install it from:
        https://www.makemkv.com

      Run the setup wizard to configure Frostscribe:
        frostscribe init

      To install and start the encode worker (runs as a launchd agent):
        frostscribe worker install
        frostscribe worker start
    EOS
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/frostscribe --version")
  end
end
