cask "ffmpeg" do
  version "9.1"
  sha256 "9962f7b3c01af9ac89673c91df9ef998343a280ac0857c295e2d2a301820598a"

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
