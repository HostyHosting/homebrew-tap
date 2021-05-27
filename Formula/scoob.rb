# typed: false
# frozen_string_literal: true

class Scoob < Formula
  desc ""
  homepage "https://github.com/HostyHosting/scoob"
  version "0.3.1"
  license "MIT"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.3.1/scoob-x86_64-apple-darwin.zip"
    sha256 "7fe30645c84302051d1202edf354e912f1e872db7c975cfde2c481123877689c"
  end

  # TODO: Separate mac out when we have ARM builds:
  # if OS.mac? && Hardware::CPU.intel?
  # end
  # if OS.mac? && Hardware::CPU.arm?
  # end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.3.1/scoob-x86_64-unknown-linux-gnu.zip"
    sha256 "225b3c7ba55d3682294f93c2d9ad0b7b6c6cf0bf1beda496901651234d136586"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.3.1/scoob-aarch64-unknown-linux-gnu.zip"
    sha256 "c396195b307cef9e267f8274bd02d1dcaa524479a4d893aeb2e9009b1d91e38c"
  end

  def install
    bin.install "scoob"
  end

  test do
    system "#{bin}/scoob" "version"
  end
end
