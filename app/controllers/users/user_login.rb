require 'sinatra/base'
require 'json'

class MyApp < Sinatra::Base
  root_path = File.expand_path('.', Dir.pwd) 
  enable :sessions
  include UserAuthentication

  set :views, root_path + "/views"
  set :public_folder, root_path + "/static"

  get '/user-login' do 
    erb :user_login
  end

  post '/user-login' do 
    user = find_user_by_national_id_and_password(params[:national_id], params[:password])
    if user.present?
      redirect "/user-login"
    end
    redirect "/user-login"
  end
end