require 'bundler/setup'
require 'data_mapper'
require 'dotenv'
Dotenv.load

Dir.glob("#{Dir.pwd}/lib/*/models.rb").each{|f| require f}

namespace :db do
  DataMapper.setup :default, "postgres://#{ENV['POSTGRES_USER']}:#{ENV['POSTGRES_PASSWORD']}@#{ENV['POSTGRES_HOST']}/#{ENV['POSTGRES_DATABASE']}"
  
  desc "migrate data to the database"
  task :migrate do 
    DataMapper.auto_migrate!
  end
end
