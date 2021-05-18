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
    sha256 "2e346deccbe0462cd24ef71e9da00e13ab82b5fe787256015bff146af4ba52b1"
  end

  # TODO: Separate mac out when we have ARM builds:
  # if OS.mac? && Hardware::CPU.intel?
  # end
  # if OS.mac? && Hardware::CPU.arm?
  # end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.2.1/scoob-x86_64-unknown-linux-gnu.zip"
    sha256 "e32513874ddaa3e04c3cdb17f5778492dd5def342eb45d445fce9b20060928e4"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.2.1/scoob-aarch64-unknown-linux-gnu.zip"
    sha256 "634ae628dfb86ea4440324c9c068d1285953d0ff6bbbe8b9b5458925a3c1c2e2"
  end

  def install
    bin.install "scoob"
  end

  test do
    system "#{bin}/scoob" "version"
  end
end
