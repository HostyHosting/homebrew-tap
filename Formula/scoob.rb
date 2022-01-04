# typed: false
# frozen_string_literal: true

class Scoob < Formula
  desc ""
  homepage "https://github.com/HostyHosting/scoob"
  version "0.6.2"
  license "MIT"

  if OS.mac?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.6.2/scoob-x86_64-apple-darwin.zip"
    sha256 "9655bc7818fb94b9ac8d014b9edb419b24466d636b048f2d209658619a179f46"
  end

  # TODO: Separate mac out when we have ARM builds:
  # if OS.mac? && Hardware::CPU.intel?
  # end
  # if OS.mac? && Hardware::CPU.arm?
  # end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.6.2/scoob-x86_64-unknown-linux-gnu.zip"
    sha256 "784e2ebbb2b28aee536a7ab7474163d420dcf0fa14769760cdefa3212b9351a5"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.6.2/scoob-aarch64-unknown-linux-gnu.zip"
    sha256 "9a56aee835cceee6dc42da94ec8d0ae51620b428b2db6aa615d021dd8b7db0d6"
  end

  def install
    bin.install "scoob"
  end

  test do
    system "#{bin}/scoob" "version"
  end
end
