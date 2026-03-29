class Frostscribe < Formula
  desc "Native macOS disc ripping and encoding tool for Jellyfin, Plex, and Kodi"
  homepage "https://github.com/trevholliday/frostscribe"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trevholliday/frostscribe/releases/download/v0.1.1/frostscribe-arm64.tar.gz"
      sha256 "e602ed7b8ab76ea03b13b3dac5180020b8e0bd4aa4a3d93d664181a4767f98bd"
    else
      url "https://github.com/trevholliday/frostscribe/releases/download/v0.1.1/frostscribe-x86_64.tar.gz"
      sha256 "87555d9b0068b0ff7c2f8cfe7f28fd296d9ae70d7cea525abc0330589a8712ab"
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
