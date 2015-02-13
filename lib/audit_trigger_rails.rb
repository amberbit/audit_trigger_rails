require "audit_trigger_rails/engine"

module AuditTriggerRails
  def self.audited_tables=(table_names)
    table_names.each do |table_name|
      ActiveRecord::Base.connection.execute "SELECT audit_table('#{table_name}');"
    end
  end
end
