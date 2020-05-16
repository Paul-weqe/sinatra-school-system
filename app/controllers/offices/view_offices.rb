require "sinatra/base"
require "json"

class MyApp < Sinatra::Base
  include OfficeHelper
  enable :sessions

  # make sure relevant directory paths have been set
  root_path = File.expand_path('.', Dir.pwd) 
  path = '/offices'
  set :views, root_path + "/views"
  set :public_folder, root_path + "/static"

  get path do 
    @offices = Office.all
    erb :view_offices
  end

  # get single office
  get "#{path}/:id" do
    @office = Office.find params[:id]
    erb :view_office_details
  end
  
end