class Frostscribe < Formula
  desc "Native macOS disc ripping and encoding tool for Jellyfin, Plex, and Kodi"
  homepage "https://github.com/trevholliday/frostscribe"
  version "0.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trevholliday/frostscribe/releases/download/v0.3.4/frostscribe-arm64.tar.gz"
      sha256 "4c892651f4bf1cfe9ef5ebf90515ca20fb963043a0c3628c16431852e227d795"
    else
      url "https://github.com/trevholliday/frostscribe/releases/download/v0.3.4/frostscribe-x86_64.tar.gz"
      sha256 "d31ad81cc176434c5d0c144b3a372545bd1130240561d9ee86aacb006196a9de"
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
