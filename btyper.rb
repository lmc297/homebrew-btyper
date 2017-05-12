class Btyper < Formula
  desc "A command line tool for classifying Bacillus cereus group isolates from nucleotide sequencing data"
  homepage "https://github.com/lmc297/BTyper/"
  url "https://github.com/lmc297/BTyper/raw/master/archive/btyper-0.0.0.tar.gz"
  sha256 "7320e5bb3743d2a36df7586358fb3f436cd9a049e04540ce9a9bcb7794971752"
  version "0.0.0"
  
  depends_on :python
  depends_on "blast"
  depends_on "spades"
  depends_on "sratoolkit"
  depends_on "numpy"
  
  resource "biopython" do
    url "http://biopython.org/DIST/biopython-1.69.tar.gz"
    sha256 "169ffa90c3d3ec5678c7a5c99501c0cfeb54c40ca51a619ce6cee5026d3403eb"
  end
 
  bottle :unneeded
   
  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    ENV.prepend_create_path 'PYTHONPATH', libexec/"lib64/python2.7/site-packages"
    %w[biopython].each do |r|
      resource(r).stage do
      system "python", *Language::Python.setup_install_args(libexec)
      end
    end
    ENV.prepend_create_path "PYTHONPATH", libexec
    libexec.install Dir["biopython"]
    bin.install Dir["btyper.py"]
    # bin.install "btyper", "seq_virulence_db", "seq_mlst_db", "seq_panC_db", "seq_rpoB_db", "seq_16s_db"
    bin.env_script_all_files(prefix, :PYTHONPATH => ENV["PYTHONPATH"])
  end
end
