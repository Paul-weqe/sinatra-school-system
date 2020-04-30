require 'sinatra/base'
require 'json'


class MyApp < Sinatra::Base
  include ValidateUserCreation
  
  before do 
    content_type 'application/json'
  end

  get '/user/sign_up' do
    User.all.to_json
  end
  
  post '/user/sign_up' do 
    json_data = JSON.parse request.body.read
    
    # Check if user details(username and email) already exist in the system
    if (User.find_by email: json_data["email"]) != nil
      status 409
      return {"error" => "user with email #{json_data["email"]} already exists"}.to_json

    elsif (User.find_by username: json_data["username"]) != nil
      status 409
      return {"error" => "user with username #{json_data["username"]} already exists"}.to_json

    end

    user = User.new
    user.email = json_data["email"]
    user.username = json_data["username"]
    user.password = json_data["password"]
    user.save == false
    
    status 201
    {:username => user.username, :email => user.email}.to_json

  end

end
