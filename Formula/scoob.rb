# typed: false
# frozen_string_literal: true

class Scoob < Formula
  desc ""
  homepage "https://github.com/HostyHosting/scoob"
  version "0.6.0"
  license "MIT"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.6.0/scoob-x86_64-apple-darwin.zip"
    sha256 "6c47e2fa9abcdebff0d97878871228469435f73b2d74431c187c5a8a43c379f7"
  end

  # TODO: Separate mac out when we have ARM builds:
  # if OS.mac? && Hardware::CPU.intel?
  # end
  # if OS.mac? && Hardware::CPU.arm?
  # end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.6.0/scoob-x86_64-unknown-linux-gnu.zip"
    sha256 "e83850ecc992aa6f267e5345cd97e4fea78e03adfe75e2eba804f0d29542304d"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.6.0/scoob-aarch64-unknown-linux-gnu.zip"
    sha256 "0b42cb6d16fa05c33263301f5d0804df6208a5bd32dbf6d2fa4fb706e9d08830"
  end

  def install
    bin.install "scoob"
  end

  test do
    system "#{bin}/scoob" "version"
  end
end
