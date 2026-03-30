class Frostscribe < Formula
  desc "Native macOS disc ripping and encoding tool for Jellyfin, Plex, and Kodi"
  homepage "https://github.com/trevholliday/frostscribe"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trevholliday/frostscribe/releases/download/v0.3.0/frostscribe-arm64.tar.gz"
      sha256 "dd2cfe040dd4f819e40158dcdf45a3219aad624ca2c9353da49f8fb32938a9b9"
    else
      url "https://github.com/trevholliday/frostscribe/releases/download/v0.3.0/frostscribe-x86_64.tar.gz"
      sha256 "488fb0d99f8cb595f4104a29db2bc59197274c9a1f46caf9aa29a4f58f5cf577"
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
