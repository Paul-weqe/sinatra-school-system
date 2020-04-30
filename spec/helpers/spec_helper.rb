require 'rack/test'
require 'rspec'
require 'active_record'

Dir.glob(File.expand_path "app/helpers/*.rb").each{|f| require f}
Dir.glob(File.expand_path "app/controllers/*/*.rb").each{|f| require f}
Dir.glob(File.expand_path "app/models/*.rb").each{|f| require f}


module RSpecMixin
    include Rack::Test::Methods
    def app() MyApp end
end

RSpec.configure { |c| c.include RSpecMixin }

RSpec.configure do |config| 
    config.expect_with :rspec do |expectations|
        expectations.syntax = :should
    end
end
