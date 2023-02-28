cask "ffmpeg" do
  version "6.0"
  sha256 "9a810d222862a7230fd7035c91e32beb605af7501c3517580f2bc1eb8faddacc"

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
