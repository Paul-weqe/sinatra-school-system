require 'sinatra/base'
require 'json'

class MyApp < Sinatra::Base
  path = "/user-login"
  enable :sessions

  include UserAuthentication
  root_path = File.expand_path('.', Dir.pwd) 
  set :views, root_path + "/views"
  set :public_folder, root_path + "/static"
  

  get path do 
    erb :user_login
  end

  post path do 
    user = find_user_by_national_id_and_password(params[:national_id], params[:password])
    if user.present?
      redirect "/user-login"
    end
    redirect "/user-login"
  end
end