module AuditTriggerRails
  class Engine < ::Rails::Engine
    isolate_namespace AuditTriggerRails
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
