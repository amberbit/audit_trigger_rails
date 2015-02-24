$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "audit_trigger_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "audit_trigger_rails"
  s.version     = AuditTriggerRails::VERSION
  s.authors     = ["Hubert Łępicki"]
  s.email       = ["hubert.lepicki@amberbit.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of AuditTriggerRails."
  s.description = "TODO: Description of AuditTriggerRails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency "pg"
end
