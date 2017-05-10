class Btyper < Formula
  desc "A command line tool for classifying Bacillus cereus group isolates from nucleotide sequencing data"
  homepage "https://github.com/lmc297/BTyper"
  url "https://github.com/lmc297/BTyper/tree/master/archive/btyper-0.0.0.tar.gz"
  sha256 ""
  
  depends_on :python
  depends_on "blast"
  depends_on "spades"
  depends_on "sratoolkit"
  
  bottle :unneeded
  
  def install
    bin.install "btyper"
  end
end
