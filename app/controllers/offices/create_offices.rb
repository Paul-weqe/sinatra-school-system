require "sinatra/base"
require "json"

class MyApp < Sinatra::Base
  include OfficeHelper
  enable :sessions

  # make sure relevant directory paths have been set
  root_path = File.expand_path('.', Dir.pwd) 
  set :views, root_path + "/views"
  set :public_folder, root_path + "/static"
  

  path = "/create-office"

  get path do 
    erb :create_office
  end

  post path do 
    office = create_office(params[:name], params[:description])
  end
end