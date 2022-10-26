cask "ffmpeg" do
  version "5.1"
  sha256 "aa0edf26bd93f4c455039365c3116a60bb9812f6dce91baa404fe19eaa102487"

  url "https://evermeet.cx/ffmpeg/ffmpeg-#{version}.zip"
  name "FFmpeg"
  desc "Static FFmpeg binaries for macOS 64-bit"
  homepage "https://evermeet.cx/ffmpeg"

  conflicts_with formula: "ffmpeg"

  binary "ffmpeg"
end
