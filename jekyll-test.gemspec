# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll/test/version"

Gem::Specification.new do |spec|
  spec.name          = "jekyll-test"
  spec.version       = Jekyll::Test::VERSION
  spec.authors       = ["James Smith"]
  spec.email         = ["james@floppy.org.uk"]

  spec.summary       = %q{An highly opinionated test configuration for Jekyll sites.}
  spec.homepage      = "https://github.com/Floppy/jekyll-test"

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ["~> 2.2", "< 2.5"]

  spec.add_dependency "rspec", "~> 3.0"
  spec.add_dependency "rake", "~> 12.0"
  spec.add_dependency 'html-proofer', "~> 3.7"
  spec.add_dependency 'travis', "~> 1.8"
  spec.add_dependency 'rspec-html-matchers', "~> 0.9"

  spec.add_development_dependency "bundler", "~> 1.15"

end
