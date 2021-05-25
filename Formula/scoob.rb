# typed: false
# frozen_string_literal: true

class Scoob < Formula
  desc ""
  homepage "https://github.com/HostyHosting/scoob"
  version "0.3.0"
  license "MIT"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.3.0/scoob-x86_64-apple-darwin.zip"
    sha256 "3d1009134cc3ee926e8a72836ff85156cd102d9ee2e9ecf9b7ab6c9240021117"
  end

  # TODO: Separate mac out when we have ARM builds:
  # if OS.mac? && Hardware::CPU.intel?
  # end
  # if OS.mac? && Hardware::CPU.arm?
  # end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.3.0/scoob-x86_64-unknown-linux-gnu.zip"
    sha256 "331c9a7c16b8035213d92142cd3a29f9e9925e188d4c6fad2bb5b954be65cf4c"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.3.0/scoob-aarch64-unknown-linux-gnu.zip"
    sha256 "ea58231d4402e3331bf5fa85a08e72ad2bee4bb34aa87bf438e968ed969f6fae"
  end

  def install
    bin.install "scoob"
  end

  test do
    system "#{bin}/scoob" "version"
  end
end
