# typed: false
# frozen_string_literal: true

class Scoob < Formula
  desc ""
  homepage "https://github.com/HostyHosting/scoob"
  version "0.6.5"
  license "MIT"

  if OS.mac?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.6.5/scoob-x86_64-apple-darwin.zip"
    sha256 "578e585d31c1254343814be9a02ae5baf7020f095f00902a7bc4d77eac289655"
  end

  # TODO: Separate mac out when we have ARM builds:
  # if OS.mac? && Hardware::CPU.intel?
  # end
  # if OS.mac? && Hardware::CPU.arm?
  # end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.6.5/scoob-x86_64-unknown-linux-gnu.zip"
    sha256 "b13f5196f37591db46e4462680090cd7cff9f23ff5ed6a8355068a45b47c2682"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.6.5/scoob-aarch64-unknown-linux-gnu.zip"
    sha256 "f31b9f68bc6b05068e8ab2e3dde86ab8e57b9d55636c921cb95976734c1abee1"
  end

  def install
    bin.install "scoob"
  end

  test do
    system "#{bin}/scoob" "version"
  end
end
