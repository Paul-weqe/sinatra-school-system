require 'sinatra/base'

class MyApp < Sinatra::Base
  root_path = File.expand_path('.', Dir.pwd) 
  enable :sessions
  include UserAuthentication

  set :views, root_path + "/views"
  set :public_folder, root_path + "/static"

  get '/sign-up' do
    @error_message = session[:error_message]
    erb :sign_up
  end

  post '/sign-up' do 
    create_user_result = create_user params
    if create_user_result.class == String
      session[:error] = create_user_result
      redirect "/sign-up"
    end
    session[:notice] = "Successfully logged into the system"
    redirect "/user-login"
  end

end
