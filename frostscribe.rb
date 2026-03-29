class Frostscribe < Formula
  desc "Native macOS disc ripping and encoding tool for Jellyfin, Plex, and Kodi"
  homepage "https://github.com/trevholliday/frostscribe"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trevholliday/frostscribe/releases/download/v0.1.0/frostscribe-arm64.tar.gz"
      sha256 "4825f196f7a038781d830d354fdd6e3968d082c75cc1cdff62370287c784dbb7"
    else
      url "https://github.com/trevholliday/frostscribe/releases/download/v0.1.0/frostscribe-x86_64.tar.gz"
      sha256 "ba78c29ef119d5613d90455386b3827e6e7a0eba268370d1b8a820efcada13d4"
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
