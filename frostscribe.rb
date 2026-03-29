class Frostscribe < Formula
  desc "Native macOS disc ripping and encoding tool for Jellyfin, Plex, and Kodi"
  homepage "https://github.com/trevholliday/frostscribe"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trevholliday/frostscribe/releases/download/v0.2.0/frostscribe-arm64.tar.gz"
      sha256 "d966a143b2fd6cc2becf031a95a029e1303da027f7eff3ad17d28166ca0c46a7"
    else
      url "https://github.com/trevholliday/frostscribe/releases/download/v0.2.0/frostscribe-x86_64.tar.gz"
      sha256 "86747a05b29b8601c318c14890ba394dea55f744ff97bf6a0ab9cc1a320ca682"
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
