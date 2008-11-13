require 'rake'

Gem::Specification.new do |spec|
  spec.name = "iterator"
  spec.version = "1.0.0"
  spec.date = "2008-11-13"
  spec.authors = ["Felipe Mesquita", "Vicente Mundim", "Claudio Escudero"]
  spec.email = ["felipe.mesquita@intelitiva.com", "vicente.mundim@intelitiva.com", "claudio.escudero@intelitiva.com"]
  spec.homepage = "git://github.com/intelitiva/iterator/tree/master"
  spec.summary = "A simple iterator for ruby arrays."
  spec.has_rdoc = false
  spec.description = "A simple iterator for ruby arrays."
  spec.files = FileList["lib/*", "spec/*", "README.rdoc"].to_a
  spec.test_files = Dir.glob('spec/*.rb')
  spec.rubyforge_project = 'iterator'
end
