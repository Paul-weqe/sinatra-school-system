require 'active_record'
require 'dotenv'
Dotenv.load

project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + "/app/models/*.rb").each{|f| require f}
Dir.glob(project_root + "/app/helpers/*.rb").each{|f| require f}
Dir.glob(project_root + "/app/controllers/*/*.rb").each{|f| require f}

database_details = { 
    encoding: 'utf8',
    adapter: 'postgresql',
    host: ENV['POSTGRES_HOST'],
    username: ENV['POSTGRES_USER'],
    password: ENV['POSTGRES_PASSWORD'],
    database: ENV['POSTGRES_DATABASE']
}

ActiveRecord::Base.establish_connection(database_details)

if __FILE__ ==  $0
    MyApp.run!
end
