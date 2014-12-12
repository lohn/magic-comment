# coding: utf-8
Gem::Specification.new do |gem|
  gem.name = 'magic_comment'
  gem.version = "0.1.0"
  gem.authors = ["Lohn IMAI"]
  gem.email = ["mail@lohn.me"]
  gem.homepage = 'http://github.com/m8x/magic_comment'
  gem.summary = 'Easily add magic comments for encoding on multiple ruby source files'

  gem.files = `git ls-files`.split($/)
  gem.executables = gem.files.grep(%r{^bin/}).map{|f| File.basename(f) }
  gem.require_paths = ["lib"]
end
