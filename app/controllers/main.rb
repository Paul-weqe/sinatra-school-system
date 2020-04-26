require 'sinatra/base'

class MyApp < Sinatra::Base
  get '/' do
    "Hello, From this app"
  end
end
