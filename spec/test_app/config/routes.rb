Rails.application.routes.draw do

  mount AuditTriggerRails::Engine => "/audit_trigger_rails"
end
