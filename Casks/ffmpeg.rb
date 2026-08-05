cask "ffmpeg" do
  version "9.0"
  sha256 "b1bd0cbaa0c889a08589dc1d14e4a08eebf425b8726c31a7e270e08552d0f271"

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
