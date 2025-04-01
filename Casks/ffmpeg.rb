cask "ffmpeg" do
  version "7.1.1"
  sha256 "8d7917c1cebd7a29e68c0a0a6cc4ecc3fe05c7fffed958636c7018b319afdda4"

  url "https://evermeet.cx/ffmpeg/ffmpeg-#{version}.zip"
  name "FFmpeg"
  desc "Static FFmpeg binaries"
  homepage "https://evermeet.cx/ffmpeg"

  livecheck do
    url "https://evermeet.cx/ffmpeg/info/ffmpeg/release"
    regex(/ffmpeg-(\d+(?:\.\d+)+)\.zip/i)
  end

  conflicts_with formula: "ffmpeg"

  binary "ffmpeg"
end
