require 'rack/test'
require 'rspec'

project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + "/app/controllers/*.rb").each{|f| require f}

module RSpecMixin 
    include Rack::Test::Methods
    def app() MyApp end
end

RSpec.configure { |c| c.include RSpecMixin }
