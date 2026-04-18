class Frostscribe < Formula
  desc "Native macOS disc ripping and encoding tool for Jellyfin, Plex, and Kodi"
  homepage "https://github.com/trevholliday/frostscribe"
  version "0.3.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trevholliday/frostscribe/releases/download/v0.3.7/frostscribe-arm64.tar.gz"
      sha256 "01001132e0a827ae21e2b4f4274c18ee87cc451ba37d153633674060bd6900bc"
    else
      url "https://github.com/trevholliday/frostscribe/releases/download/v0.3.7/frostscribe-x86_64.tar.gz"
      sha256 "7034df9d66a11064ba1e1f520fd4f3a6cad3876b1b44f05842ef691eaa766182"
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
