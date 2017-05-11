class Btyper < Formula
  desc "A command line tool for classifying Bacillus cereus group isolates from nucleotide sequencing data"
  homepage "https://github.com/lmc297/BTyper/"
  url "https://github.com/lmc297/BTyper/raw/master/archive/btyper-0.0.0.tar.gz"
  sha256 "d6c8b25a10a118a157ad632fd043ecd5261281c70fc0ec06dd2fb9a557181069"
  version "0.0.0"
  
  depends_on :python
  depends_on "blast"
  depends_on "spades"
  depends_on "sratoolkit"
  depends_on "numpy"
  resource "biopython" do
    url "http://biopython.org/wiki/Download/biopython-1.69.tar.gz"
    sha256 "e89a94071b716d7bb7e97db898b33ad3afecfa8a53fa4e5b57f8e4259956c29d"
  end
  
  bottle :unneeded
  
  def install
    bin.install "btyper", "seq_virulence_db", "seq_mlst_db", "seq_panC_db", "seq_rpoB_db", "seq_16s_db"
  end
end
