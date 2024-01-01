cask "ffmpeg" do
  version "6.1.1"
  sha256 "7de74c26a20dd172ed49c7de6035ee0790c83e69e461c3a6895b33ae0787e513"

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
