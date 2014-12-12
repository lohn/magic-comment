Gem::Specification.new do |s|
  s.name = %q{magic_encoding_for_utf8}
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lohn IMAI"]
  s.date = %q{2014-12-12}
  s.default_executable = %q{magic_encoding_for_utf8}
  s.email = ["mail@lohn.me"]
  s.executables = ["magic_encoding_for_utf8"]
  s.files = Dir.glob("{bin,lib}/**/*") + %w(README.rdoc CHANGELOG LICENCE)
  s.homepage = %q{http://github.com/m8x/magic_encoding}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Easily add magic comments for encoding on multiple ruby source files}
end
