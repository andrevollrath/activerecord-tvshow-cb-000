require "bundler/setup"
require 'yaml'
require 'active_record'

Bundler.require


DBNAME = "tvshows"


Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}


#require File.join(File.dirname(__FILE__),"../lib", "support", "connection_adapter.rb")
#require File.join(File.dirname(__FILE__),"../lib", "support", "db_registry.rb")
Dir[File.join(File.dirname(__FILE__), "../lib/support", "*.rb")].sort.each {|f| require f}

connection_details = YAML::load(File.open('config/database.yml'))

# DBRegistry[ENV["ACTIVE_RECORD_ENV"]].connect!
DB = ActiveRecord::Base.establish_connection(connection_details)

if ENV["ACTIVE_RECORD_ENV"] == "test"
  ActiveRecord::Migration.verbose = false
end
