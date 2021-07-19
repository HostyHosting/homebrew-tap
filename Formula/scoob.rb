# typed: false
# frozen_string_literal: true

class Scoob < Formula
  desc ""
  homepage "https://github.com/HostyHosting/scoob"
  version "0.5.0"
  license "MIT"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.5.0/scoob-x86_64-apple-darwin.zip"
    sha256 "20d875eb1666c6e6259e771a1da34dd2017e570ffc0642845f9947fb04b0782b"
  end

  # TODO: Separate mac out when we have ARM builds:
  # if OS.mac? && Hardware::CPU.intel?
  # end
  # if OS.mac? && Hardware::CPU.arm?
  # end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.5.0/scoob-x86_64-unknown-linux-gnu.zip"
    sha256 "500023def35fe94f0afab25fa99faaf3132c67c7487e44373f4d4df6f2fe4315"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.5.0/scoob-aarch64-unknown-linux-gnu.zip"
    sha256 "7465542a05c594320956cbf9abc246ffa60decd441ae6186f17a0be8e42c8dcd"
  end

  def install
    bin.install "scoob"
  end

  test do
    system "#{bin}/scoob" "version"
  end
end
