require 'sinatra/base'


class MainApp < Sinatra::Base
  root_path = File.expand_path('.', Dir.pwd)
  sign_up_path = "/sign-up"
  login_path = "/login"
  
  enable :sessions
  set :views, root_path + "/views"
  
  # create user
  get sign_up_path do
    erb :sign_up
  end
  
  post sign_up_path do 

    user = User.new
    user.national_id = params[:national_id]
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.password = params[:password]
    user.save
    puts params
  end
   
  # login user
  get login_path do
    
  end
end

