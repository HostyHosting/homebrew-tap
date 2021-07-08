# typed: false
# frozen_string_literal: true

class Scoob < Formula
  desc ""
  homepage "https://github.com/HostyHosting/scoob"
  version "0.4.3"
  license "MIT"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.4.3/scoob-x86_64-apple-darwin.zip"
    sha256 "3d8b4faa92b9fc05ecf47c0ccf8252d9692fac16f99c62c1473cded587b54089"
  end

  # TODO: Separate mac out when we have ARM builds:
  # if OS.mac? && Hardware::CPU.intel?
  # end
  # if OS.mac? && Hardware::CPU.arm?
  # end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.4.3/scoob-x86_64-unknown-linux-gnu.zip"
    sha256 "410e1426bba4d955101a0491a9ef7fa689f32fae73b14e0dc7d44bb8a965245c"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.4.3/scoob-aarch64-unknown-linux-gnu.zip"
    sha256 "d1483d3d1f8c42f36be1f73ff77da81a39eae20e491c4918164bf20ab70fde2b"
  end

  def install
    bin.install "scoob"
  end

  test do
    system "#{bin}/scoob" "version"
  end
end
