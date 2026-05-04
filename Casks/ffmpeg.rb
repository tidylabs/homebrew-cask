cask "ffmpeg" do
  version "8.1.1"
  sha256 "4610988e2f54c243c50da73a09e4e2c36d9bb77546f9aa6c84cb328dcb1a98c1"

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
