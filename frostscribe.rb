class Frostscribe < Formula
  desc "Native macOS disc ripping and encoding tool for Jellyfin, Plex, and Kodi"
  homepage "https://github.com/trevholliday/frostscribe"
  version "0.3.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trevholliday/frostscribe/releases/download/v0.3.6/frostscribe-arm64.tar.gz"
      sha256 "8129769c2c9978bf2c50fd81fa34e70b714db0bf114356e8a48616de787eb656"
    else
      url "https://github.com/trevholliday/frostscribe/releases/download/v0.3.6/frostscribe-x86_64.tar.gz"
      sha256 "b6537afd3ce3f0930cca231f6ab06f0f26d56d8cbbfd5626c0b44b3d71203091"
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
