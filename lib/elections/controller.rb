require 'sinatra/base'

class MainApp < Sinatra::Base
  get '/' do
    'Hi ther'
  end
end
