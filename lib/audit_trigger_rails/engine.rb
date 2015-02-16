module AuditTriggerRails
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      AuditTriggerRails.clear_app_data
      @app.call(env)
    end
  end

  class Engine < ::Rails::Engine
    isolate_namespace AuditTriggerRails
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer "audit_trigger_rails.add_middleware" do |app|
      app.middleware.use AuditTriggerRails::Middleware
    end

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end
  end
end
