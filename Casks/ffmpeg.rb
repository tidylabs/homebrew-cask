cask "ffmpeg" do
  version "5.0"
  sha256 "c713a4f0aaa20ad4e3e82cfa76ae6af333c13f90f96bc0db3fad635449f94304"

  url "https://evermeet.cx/ffmpeg/ffmpeg-#{version}.zip"
  name "FFmpeg"
  desc "Static FFmpeg binaries for macOS 64-bit"
  homepage "https://evermeet.cx/ffmpeg"

  conflicts_with formula: "ffmpeg"

  binary "ffmpeg"
end
