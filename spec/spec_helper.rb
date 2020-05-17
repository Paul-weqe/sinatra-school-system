require 'rack/test'
require 'rspec'
require 'data_mapper'

Dir.glob(File.expand_path "helpers/*.rb").each{|f| require f}
Dir.glob(File.expand_path "lib/*/controller.rb").each{|f| require f}
Dir.glob(File.expand_path "lib/*/models.rb").each{|f| require f}

DataMapper.setup(:default, "sqlite3::memory:")
DataMapper.finalize
DataMapper.auto_migrate!
