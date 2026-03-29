class Frostscribe < Formula
  desc "Native macOS disc ripping and encoding tool for Jellyfin, Plex, and Kodi"
  homepage "https://github.com/trevholliday/frostscribe"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trevholliday/frostscribe/releases/download/v0.1.2/frostscribe-arm64.tar.gz"
      sha256 "669f31f4296fa8157872097ccf00144431ea92e5f71dc6d67c532f83c7558641"
    else
      url "https://github.com/trevholliday/frostscribe/releases/download/v0.1.2/frostscribe-x86_64.tar.gz"
      sha256 "ea45b69fa2c44b355107635d8ef40595a016c9d52d073f8876f99ee80c2f52ad"
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
