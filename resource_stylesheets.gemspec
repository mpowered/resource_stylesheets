# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "resource_stylesheets/version"

Gem::Specification.new do |s|
  s.name        = "resource_stylesheets"
  s.version     = ResourceStylesheets::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Gary Greyling"]
  s.email       = ["greyling.gary@gmail.com"]
  s.homepage    = "http://github.com/mpowered/resource_stylesheets"
  s.summary     = %q{Optionally loaded stylesheets for projects with crazy amounts of CSS files}
  s.description = %q{Configure groups of stylesheets by the current resource's name, they will be included as needed intead of always}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
