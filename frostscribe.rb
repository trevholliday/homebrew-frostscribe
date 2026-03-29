class Frostscribe < Formula
  desc "Native macOS disc ripping and encoding tool for Jellyfin, Plex, and Kodi"
  homepage "https://github.com/trevholliday/frostscribe"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/trevholliday/frostscribe/releases/download/v0.2.1/frostscribe-arm64.tar.gz"
      sha256 "089d3272b53b2882322be0a31dcca6a12e710d31a2e197f77195bc519ca6983a"
    else
      url "https://github.com/trevholliday/frostscribe/releases/download/v0.2.1/frostscribe-x86_64.tar.gz"
      sha256 "6422b558e89ed2fb314e937c5d54c641cc0843bf37a003e780253e5cad29aff7"
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
