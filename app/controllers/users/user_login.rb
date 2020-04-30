require 'sinatra/base'
require 'json'

class MyApp < Sinatra::Base

    before do 
        content_type 'application/json'
    end

    post '/user/login' do
        json_data = JSON.parse request.body.read

        email       = json_data["email"]
        password    = json_data["password"]
        
        puts email
        puts password
        user        = User.find_by :email => email, :password => password

        if user == nil
            status 401
            {"error" => "email or password entered is incorrect. Please try again"}
        else
            {:email => user.email, :username => user.username}.to_json
        end
    end
end