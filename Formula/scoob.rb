# typed: false
# frozen_string_literal: true

class Scoob < Formula
  desc ""
  homepage "https://github.com/HostyHosting/scoob"
  version "0.0.4-pre.3"
  license "MIT"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.0.4-pre.3/scoob-x86_64-apple-darwin.zip"
    sha256 "2fc483ce0d862b72aed74b28297096c22f835356612e8e9e48341971377ac461"
  end

  # TODO: Separate mac out when we have ARM builds:
  # if OS.mac? && Hardware::CPU.intel?
  # end
  # if OS.mac? && Hardware::CPU.arm?
  # end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.0.4-pre.3/scoob-x86_64-unknown-linux-gnu.zip"
    sha256 "4d975947c4388698756156296a47f878f42da83031510938149132e3335383c6"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/HostyHosting/scoob/releases/download/v0.0.4-pre.3/scoob-aarch64-unknown-linux-gnu.zip"
    sha256 "b2fe299c393f05e40a984a83eee06bca608be034aae6e2b9b764d24998de6885"
  end

  def install
    bin.install "scoob"
  end

  test do
    system "#{bin}/scoob" "version"
  end
end
