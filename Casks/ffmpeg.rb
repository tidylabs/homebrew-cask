cask "ffmpeg" do
  version "5.1.1"
  sha256 "9cd8808b50da3fcf434110572464db67f9ea3613b0731d27ce2eddddea3dfc14"

  url "https://evermeet.cx/ffmpeg/ffmpeg-#{version}.zip"
  name "FFmpeg"
  desc "Static FFmpeg binaries for macOS 64-bit"
  homepage "https://evermeet.cx/ffmpeg"

  conflicts_with formula: "ffmpeg"

  binary "ffmpeg"
end
