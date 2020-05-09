require 'sinatra/base'
require 'json'
require 'haml'


class MyApp < Sinatra::Base
  root_path = File.expand_path('.', Dir.pwd) 
  enable :sessions

  set :views, root_path + "/views"
  set :public_folder, root_path + "/static"

  get '/sign-up' do
    @error_message = session[:error_message]
    erb :sign_up
  end

  post '/sign-up' do 
    
    params.each do |k, v|
      if v.strip == ""
        session[:error_message] = "Field #{k} cannot be left blank"
        redirect "/sign-up"
      end
    end
  end

end
