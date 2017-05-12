class BtyperBiopython < Formula
  desc "A command line tool for classifying Bacillus cereus group isolates from nucleotide sequencing data"
  homepage "https://github.com/lmc297/BTyper/"
  url "http://biopython.org/DIST/biopython-1.69.tar.gz"
  sha256 "169ffa90c3d3ec5678c7a5c99501c0cfeb54c40ca51a619ce6cee5026d3403eb"
 
  depends_on :python
  depends_on "numpy"
  
  
  bottle :unneeded 
   
  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib64/python2.7/site-packages"
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    ENV.prepend "PYTHONPATH", libexec, ':'
    ENV.prepend "PYTHONPATH", libexec/"src", ':'
    for python_package in ["biopython"]
      resource(python_package).stage do
        system "python", *Language::Python.setup_install_args(libexec)
      end
    end
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end
end
