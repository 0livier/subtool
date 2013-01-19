# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__), 'lib', 'subtool', 'version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'subtool'
  s.version = Subtool::VERSION
  s.author = 'Olivier Garcia'
  s.email = 'olivier@lol.cat'
  s.homepage = 'http://linux-nerd.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'CLI tool for manipulating subtitles files'
  s.description = 'subtool is a library and CLI program to add (or remove) delay in subtitles files'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = %w(lib)

  s.add_development_dependency('rake')
  s.add_development_dependency('aruba')
  s.add_development_dependency('simplecov')
end
