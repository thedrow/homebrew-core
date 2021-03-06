class YouGet < Formula
  include Language::Python::Virtualenv

  desc "Dumb downloader that scrapes the web"
  homepage "https://you-get.org/"
  url "https://github.com/soimort/you-get/releases/download/v0.4.1025/you-get-0.4.1025.tar.gz"
  sha256 "d348b89bd4798ef2225f5b357510505a4bc781380479c9f59b69d80ff9a56ab5"
  revision 1
  head "https://github.com/soimort/you-get.git", :branch => "develop"

  bottle do
    cellar :any_skip_relocation
    sha256 "f95a1fed6e435898e125dcf80124409830f842e6eddc3ed932f0e62dee77e0d7" => :high_sierra
    sha256 "ea4357c0e228c72a75234c0829adaedc72029d8c157c092050d51adb454328ca" => :sierra
    sha256 "d60789b8d2eca71f0f9cde6cab9dceea1ca8bcbf9618201b6873d4f479f1ac32" => :el_capitan
  end

  depends_on "python"

  depends_on "rtmpdump" => :optional

  def install
    virtualenv_install_with_resources
  end

  def caveats
    "To use post-processing options, `brew install ffmpeg` or `brew install libav`."
  end

  test do
    system bin/"you-get", "--info", "https://youtu.be/he2a4xK8ctk"
  end
end
