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
    bin.install "btyper", "seq_virulence_db", "seq_mlst_db", "seq_panC_db", "seq_rpoB_db", "seq_16s_db"
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib64/python2.7/site-packages"
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    ENV.prepend "PYTHONPATH", libexec, ':'
    ENV.prepend "PYTHONPATH", libexec/"src", ':'
    puts "done with env"
    # for python_package in ["biopython"]
    resource("biopython").stage do
      system "python", *Language::Python.setup_install_args(libexec)
      puts "done with python"
    end
    puts "done with resource"
    # end
    libexec.install Dir["*"]
    puts "done with libexecinstall"
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
    bin.env_script_all_files(libexec/"lib/python2.7/site-packages/Bio", :PYTHONPATH => ENV["PYTHONPATH"])
    bin.env_script_all_files(libexec/"lib64/python2.7/site-packages", :PYTHONPATH => ENV["PYTHONPATH"])

    puts "done with errthing"
    

  end
end
