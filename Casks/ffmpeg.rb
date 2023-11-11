cask "ffmpeg" do
  version "6.0.1"
  sha256 "1b5bdb6be9f9601b6951672f99a18cb89c0d6e59ccc1453314f94b4d0579271b"

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
