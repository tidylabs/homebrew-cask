cask "ffmpeg" do
  version "9.0.2"
  sha256 "4acc0be580f9b2788029eb7bd4d645ff87968911b0a62aeeb3940d42d54558d5"

  url "https://evermeet.cx/ffmpeg/ffmpeg-#{version}.zip"
  name "FFmpeg"
  desc "Static FFmpeg binaries"
  homepage "https://evermeet.cx/ffmpeg"

  livecheck do
    url "https://evermeet.cx/ffmpeg/info/ffmpeg/release"
    regex(/ffmpeg-(\d+(?:\.\d+)+)\.zip/i)
  end

  binary "ffmpeg"
end
