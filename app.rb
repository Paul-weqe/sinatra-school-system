require 'data_mapper'
require 'dotenv'
Dotenv.load

Dir.glob("#{Dir.pwd}/helpers/*.rb").each{|f| require f}
Dir.glob("#{Dir.pwd}/lib/*/controller.rb").each{|f| require f}
Dir.glob("#{Dir.pwd}/lib/*/models.rb").each{|f| require f}
DataMapper.setup :default, "postgres://#{ENV['POSTGRES_USER']}:#{ENV['POSTGRES_PASSWORD']}@#{ENV['POSTGRES_HOST']}/#{ENV['POSTGRES_DATABASE']}"

if __FILE__ ==  $0
    MainApp.run!
end

