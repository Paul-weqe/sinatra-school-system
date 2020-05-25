require 'sinatra/base'

class MainApp < Sinatra::Base
  include IntakeValidation
  root_path = File.expand_path('.', Dir.pwd)
  create_intake_path = "/create-intake"

  get create_intake_path do 
    erb :create_intake
  end

  post create_intake_path do
    params[:month_number] = params[:month_number].to_i
    create_intake_response = create_intake params
    if create_intake_response.class == String
      return create_intake_response
    end
    "Sucessfully created Intake #{params[:name]}"
  end
  
end