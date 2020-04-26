require 'bundler/setup'
require 'active_record'
require 'pg'

namespace :db do
   
  desc "Migrate the information from db/migrate"
  task :migrate do
    ActiveRecord::Base.establish_connection(
      encoding: 'utf8',
      adapter: 'postgresql',
      host: 'localhost',
      username: 'postgres',
      password: 'Omwene11@',
      database: 'school_sinatra'
    )
    ActiveRecord::MigrationContext.new('db/migrate', ActiveRecord::SchemaMigration).migrate
  end

end
