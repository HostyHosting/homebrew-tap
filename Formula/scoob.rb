# typed: false
# frozen_string_literal: true

class Scoob < Formula
  desc ""
  homepage "https://github.com/HostyHosting/scoob"
  version "0.3.2"
  license "MIT"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.3.2/scoob-x86_64-apple-darwin.zip"
    sha256 "583c38e9cd86c690612a320f1416ffa55813a5ed7980b7da7cfbbc9f2ace1e93"
  end

  # TODO: Separate mac out when we have ARM builds:
  # if OS.mac? && Hardware::CPU.intel?
  # end
  # if OS.mac? && Hardware::CPU.arm?
  # end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.3.2/scoob-x86_64-unknown-linux-gnu.zip"
    sha256 "b72eb2b52ce49d22ae79809cbd713f3943484a2146fd7ef1cad4d863760547f1"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.3.2/scoob-aarch64-unknown-linux-gnu.zip"
    sha256 "4ffb3ca21ac7296e1f3c7d388593626ac1540a33f836c747cab1214ebf344735"
  end

  def install
    bin.install "scoob"
  end

  test do
    system "#{bin}/scoob" "version"
  end
end
