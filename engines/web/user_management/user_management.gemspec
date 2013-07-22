$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "user_management/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "user_management"
  s.version     = UserManagement::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of UserManagement."
  s.description = "TODO: Description of UserManagement."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "haml"

  s.add_development_dependency "sqlite3"
end
