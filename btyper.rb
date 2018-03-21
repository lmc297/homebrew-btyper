class Btyper < Formula
  desc "A command line tool for classifying Bacillus cereus group isolates from nucleotide sequencing data"
  homepage "https://github.com/lmc297/BTyper/"
  url "https://github.com/lmc297/BTyper/raw/master/archive/btyper-2.2.0.tar.gz"
  sha256 "d4909bfdf2d6fe929a151d1f7bd4417bbb1d9aaa200648a8bc3fab551fefe6f2"
  version "2.2.0"
  
  #depends_on "python"
  depends_on "blast"
  depends_on "spades"
  depends_on "sratoolkit"
  
  bottle :unneeded 
   
  def install
    bin.install "btyper", "seq_virulence_db", "seq_mlst_db", "seq_panC_db", "seq_rpoB_db", "seq_16s_db", "seq_amr_db", "seq_plasmid_db"
    puts "done with env"


  end
end
