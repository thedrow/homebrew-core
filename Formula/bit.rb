require "language/node"

class Bit < Formula
  desc "Distributed Code Component Manager"
  homepage "https://www.bitsrc.io"
  url "https://registry.npmjs.org/bit-bin/-/bit-bin-0.12.6.tgz"
  sha256 "666f986273876f7fb5801e1d9c195e01d67827dfb6d5511188eaeede4be3eb4d"
  head "https://github.com/teambit/bit.git"

  bottle do
    sha256 "0331eb24d6b02840adb01daa85b42906ba6b44b62a17bb364365e1ba2b4d39bd" => :high_sierra
    sha256 "a03d7bc34f0244b6778b5791eefb642551c39f0d69a323c4a49de5f97edfb84d" => :sierra
    sha256 "2590fbe0aa10a87b0981ff1ad97c1ff1816dfa8c2741f050401560ba95e48818" => :el_capitan
    sha256 "03f5dc24238f36bcd54e9a810e9f9f37e1f2c6afd50acde1a8533ba370504f89" => :x86_64_linux
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal "successfully initialized an empty bit scope.\n",
                 shell_output("#{bin}/bit init --skip-update")
  end
end
