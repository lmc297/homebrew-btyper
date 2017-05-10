class btyper < Formula
	desc "A command line tool for classifying Bacillus cereus group isolates from nucleotide sequencing data"
	homepage "https://github.com/lmc297/homebrew-btyper"
	url "https://github.com/lmc297/homebrew-btyper/archive/btyper-0.0.0.tar.gz"
	sha256 "9b396fb70bc1ef951c7d893ea92423d1f638833e7da76ab935b6f4675a330e0b"
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
		bin.install "btyper"
	end
end
