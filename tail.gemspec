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
  s.summary     = "Tail command for your .log files via browser."
  s.description = "In order to have a quick access to your .log files this gem provides *nix `tail` command functionality to your Rails application. If something goes wrong you don't have to ssh to your server anymore. Now you have normal scroll and search in browser instead of `nano`, `eamacs`, `vim`, `mcedit` - name it."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.post_install_message = "Don't forget to mount gem (routes.rb) like this: mount Tail::Engine, at: \"/tail\" "


  s.add_dependency "rails", ">= 4.0"
  s.required_ruby_version = ">= 1.9.3"
end
