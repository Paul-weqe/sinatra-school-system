require 'sinatra/base'


class MainApp < Sinatra::Base
  # create user 
  path = "/user-signup"
  enable :sessions
  
  get path do 
    "Hello World"
  end
  
  # login user
end
