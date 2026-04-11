class Frostscribe < Formula
  desc "Native macOS disc ripping and encoding tool for Jellyfin, Plex, and Kodi"
  homepage "https://github.com/trevholliday/frostscribe"
  version "0.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trevholliday/frostscribe/releases/download/v0.3.5/frostscribe-arm64.tar.gz"
      sha256 "fe523d853624d6f7461fbf2d580289908faa51770c0ae6411d9df25b344863a6"
    else
      url "https://github.com/trevholliday/frostscribe/releases/download/v0.3.5/frostscribe-x86_64.tar.gz"
      sha256 "df1bcd40f0ab73b19b685dc8c9f9340e84a0082a549c5bff4b549aca4f7ca935"
    end
  end

  depends_on :macos => :sonoma

  def install
    bin.install "frostscribe"
    bin.install "frostscribe-worker"
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
    assert_match version.to_s, shell_output("#{bin}/frostscribe --version")
  end
end
