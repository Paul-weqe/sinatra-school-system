require File.expand_path '../spec_helper.rb', __FILE__
require 'json'

describe "base get route json" do 
    it "should return 200 status code" do 
        get '/users'   
        expect(last_response).to be_ok
    end

    it "should be a json string" do 
        get '/users'

        expected_response = {"name" => "paul"}
        
        
        expected_response.should eq(JSON.parse(last_response.body))

    end

end