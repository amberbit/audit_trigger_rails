require "audit_trigger_rails/engine"
require "temping"

module AuditTriggerRails
  def self.audited_tables=(table_names)
    table_names.each do |table_name|
      ActiveRecord::Base.connection.execute "SELECT audit_table('#{table_name}');"
    end
  rescue ActiveRecord::StatementInvalid
    Rails.logger.warn "Skipping initializing audition for tables: #{table_names.join(" ")}, run audit_trigger_rails migrations first"
  end

  def self.app_data=(data)
    clear_app_data
    ActiveRecord::Base.connection.execute "CREATE TABLE temporary_app_data (id serial PRIMARY KEY, app_data hstore)"

    TemporaryAppData.create app_data: data
  end

  def self.clear_app_data
    ActiveRecord::Base.connection.execute "DROP TABLE IF EXISTS temporary_app_data;"
  end
end

