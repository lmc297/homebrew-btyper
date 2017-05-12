class BtyperBiopython < Formula
  desc "A command line tool for classifying Bacillus cereus group isolates from nucleotide sequencing data"
  homepage "https://github.com/lmc297/BTyper/"
  url "https://github.com/lmc297/BTyper/raw/master/archive/btyper-0.0.0.tar.gz"
  sha256 "7320e5bb3743d2a36df7586358fb3f436cd9a049e04540ce9a9bcb7794971752"
  version "0.0.0"
  
  depends_on :python
  depends_on "numpy"
  
  resource "biopython" do
    url "http://biopython.org/DIST/biopython-1.69.tar.gz"
    sha256 "169ffa90c3d3ec5678c7a5c99501c0cfeb54c40ca51a619ce6cee5026d3403eb"
  end
 
  bottle :unneeded 
   
  def install
    inreplace "setupext.py", "'darwin': ['/usr/local/'", "'darwin': ['#{HOMEBREW_PREFIX}'"
    Language::Python.each_python(build) do |python, version|
    bundle_path = libexec/"lib/python2.7/site-packages"
    bundle_path.mkpath
    ENV.prepend_path "PYTHONPATH", bundle_path
    resources.map(&:name).to_set
    res.each do |r|
      resource(r).stage do
        system python, *Language::Python.setup_install_args(libexec)
      end
    end
    (lib/"python2.7/site-packages/homebrew-btyper-biopython-bundle.pth").write "#{bundle_path}\n"

    system python, *Language::Python.setup_install_args(prefix)
  end
end
