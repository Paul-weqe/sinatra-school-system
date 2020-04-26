require 'bundler/setup'
require 'active_record'
require 'pg'
require 'yaml'

require 'dotenv'
Dotenv.load


database_details = { 
    encoding: 'utf8',
    adapter: 'postgresql',
    host: ENV['POSTGRES_HOST'],
    username: ENV['POSTGRES_USER'],
    password: ENV['POSTGRES_PASSWORD'],
    database: ENV['POSTGRES_DATABASE']
}

create_db_details = {
    encoding: 'utf8',
    adapter: 'postgresql',
    host: ENV['POSTGRES_HOST'],
    username: ENV['POSTGRES_USER'],
    password: ENV['POSTGRES_PASSWORD']
}

namespace :db do
   
  desc "Migrate the information from db/migrate"
  task :migrate do
    ActiveRecord::Base.establish_connection(database_details)
    ActiveRecord::MigrationContext.new('db/migrate', ActiveRecord::SchemaMigration).migrate
  end

  desc "Create The Database"
  task :create do
    ActiveRecord::Base.establish_connection(create_db_details)
    ActiveRecord::Base.connection.create_database(database_details[:database])
  end

end
