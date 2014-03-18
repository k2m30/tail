$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tail/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tail"
  s.version     = Tail::VERSION
  s.authors     = ["Mikhail Chuprynski"]
  s.email       = ["mikhail.chuprynski@gmail.com"]
  s.homepage    = "http://github.com/k2m30/tail"
  s.summary     = "Tail command via web."
  s.description = "Provides tail functionality via browser"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
end
