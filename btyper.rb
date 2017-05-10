class Btyper < Formula
	desc "A command line tool for classifying Bacillus cereus group isolates from nucleotide sequencing data"
	homepage "https://github.com/lmc297/homebrew-btyper"
	url "https://github.com/lmc297/homebrew-btyper/tree/master/archive/btyper-0.0.0.tar.gz"
	sha256 "ae16342951f19d82d4061e5d6b5df0a397d6b5cd282a14d37232f09cdbea7194"
	version "0.0.0"
	depends_on :python
	depends_on "blast"
	depends_on "spades"
	depends_on "sratoolkit"
	#resource "biopython" do
	#	url "http://biopython.org/wiki/Download/biopython-1.69.tar.gz"
	#	sha1
	#end
	bottle :unneeded
	def install
		bin.install "Btyper"
	end
end
