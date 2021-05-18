# typed: false
# frozen_string_literal: true

class Scoob < Formula
  desc ""
  homepage "https://github.com/HostyHosting/scoob"
  version "0.2.3"
  license "MIT"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.2.3/scoob-x86_64-apple-darwin.zip"
    sha256 "e2e945bc63b544eb7954b2f1da79e2f32cec952a85ad28e62756559b84771bc4"
  end

  # TODO: Separate mac out when we have ARM builds:
  # if OS.mac? && Hardware::CPU.intel?
  # end
  # if OS.mac? && Hardware::CPU.arm?
  # end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.2.3/scoob-x86_64-unknown-linux-gnu.zip"
    sha256 "64be4d237ea51aa1163b7dcd41174ff5a811bb6218908c42f329f06faf1af392"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.2.3/scoob-aarch64-unknown-linux-gnu.zip"
    sha256 "6cb65be3449aefe9dd33a202b969ffe450f07b6a0222e7430e5be3e07b7f683e"
  end

  def install
    bin.install "scoob"
  end

  test do
    system "#{bin}/scoob" "version"
  end
end
