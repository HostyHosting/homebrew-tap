# typed: false
# frozen_string_literal: true

class Scoob < Formula
  desc ""
  homepage "https://github.com/HostyHosting/scoob"
  version "0.0.0"
  license "MIT"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.2.1/scoob-x86_64-apple-darwin.zip"
    sha256 "cd39f501a51dd3a0bc55e397aa6f5923715bb436b1ca762e0a79e35287871ace"
  end

  # TODO: Separate mac out when we have ARM builds:
  # if OS.mac? && Hardware::CPU.intel?
  # end
  # if OS.mac? && Hardware::CPU.arm?
  # end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.2.1/scoob-x86_64-unknown-linux-gnu.zip"
    sha256 "d468dbba5e5b72926839a998bcbda0ec93006e18f9be51137e29c57e6eea979e"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.2.1/scoob-aarch64-unknown-linux-gnu.zip"
    sha256 "8784644525f1dab8fe0cc51a334f909766a0a1ed55583eca67f00da541a9609c"
  end

  def install
    bin.install "scoob"
  end

  test do
    system "#{bin}/scoob" "version"
  end
end
