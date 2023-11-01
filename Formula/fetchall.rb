require_relative "../configs/config"

class Fetchall < Formula
  package_name = "fetchall"
  config = Config.new(package_name)

  desc "Run `git fetch` on all registered directories at once."
  homepage "https://github.com/kiharito/#{package_name}"
  version "v1.0.0"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url config.mac_arm64["url"]
      sha256 config.mac_arm64["sha256"]
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url config.mac_x86_64["url"]
      sha256 config.mac_x86_64["sha256"]
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url config.linux_arm64["url"]
      sha256 config.linux_arm64["sha256"]
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url config.linux_x86_64["url"]
      sha256 config.linux_x86_64["sha256"]
    end
  end

  def install
    bin.install "fetchall"
  end

  test do
    system "#{bin}/#{package_name} --version"
  end
end
