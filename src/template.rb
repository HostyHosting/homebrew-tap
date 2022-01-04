# typed: false
# frozen_string_literal: true

class Scoob < Formula
  desc ""
  homepage "https://github.com/HostyHosting/scoob"
  version "{{ VERSION }}"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "{{ MAC_URL }}"
    sha256 "{{ MAC_SHA }}"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "{{ MAC_URL_ARM }}"
    sha256 "{{ MAC_SHA_ARM }}"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "{{ LINUX_URL }}"
    sha256 "{{ LINUX_SHA }}"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "{{ LINUX_URL_ARM }}"
    sha256 "{{ LINUX_SHA_ARM }}"
  end

  def install
    bin.install "scoob"
  end

  test do
    system "#{bin}/scoob" "version"
  end
end
