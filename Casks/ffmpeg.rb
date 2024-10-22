cask "ffmpeg" do
  version "7.1"
  sha256 "5a1303c7babaffff3c32c141ff49c7f44bd3b3b3e7dcea992fd7d04b6558ef43"

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
