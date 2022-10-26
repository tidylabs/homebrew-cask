cask "ffmpeg" do
  version "5.0.1"
  sha256 "6ba850f5d7a8ff1c33c7df99a1ec37687bf33b7b7c8135918ce994fc82f9c46c"

  url "https://evermeet.cx/ffmpeg/ffmpeg-#{version}.zip"
  name "FFmpeg"
  desc "Static FFmpeg binaries for macOS 64-bit"
  homepage "https://evermeet.cx/ffmpeg"

  conflicts_with formula: "ffmpeg"

  binary "ffmpeg"
end
