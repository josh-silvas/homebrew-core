# typed: false
# frozen_string_literal: true
class Dmux < Formula
  desc "DMux is a cli tool with ssh functionality for assist Network Engineering teams."
  homepage "https://github.com/josh-silvas/dmux"
  version "1.0.0-beta.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/josh-silvas/dmux/releases/download/1.0.0-beta.0/dmux_darwin_arm64.tar.gz"
      sha256 "72ddf24a3ab82bd9c0d8299f27e08e7de9a67229e50eeabf20666f072daa8146"

      def install
        bin.install 'dmux'
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/josh-silvas/dmux/releases/download/1.0.0-beta.0/dmux_darwin_amd64.tar.gz"
      sha256 "51e9d301d204d476d0d14ccc36b5d02ae6edeb61cc2dbc7960b412a406966e56"

      def install
        bin.install 'dmux'
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/josh-silvas/dmux/releases/download/1.0.0-beta.0/dmux_linux_amd64.tar.gz"
      sha256 "958124ffffee57f54266c73ee2736ee36d0bacf4aaf580102d36495d661037d4"

      def install
        bin.install 'dmux'
      end
    end
  end

  def caveats
    <<~EOS
      DMux v1.0.0-beta.0 Notes:
        1. DMux will create it's own system keychain called 'DMux-Keyring'
          1a. You may need to reauthenticate dmux to this keychain after update because the binary is
              a different signature.
        2. Release changelog located at:
          - https://github.com/josh-silvas/dmux/releases/tag/1.0.0-beta.0
        3. For issues with this tool, please submit a GitHub issue here:
          - https://github.com/josh-silvas/dmux/issues
      v1.0.0-beta.0 NEW RELEASE INFO:
        4. Initial release!
    EOS
  end

  test do
    version_output = shell_output('#{bin}/dmux version')
    assert_match version_output, version.to_s
  end
end
