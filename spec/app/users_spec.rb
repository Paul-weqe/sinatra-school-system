require File.expand_path 'spec/helpers/spec_helper.rb'
require 'json'
require 'active_record'
require 'dotenv'
require_relative 'database_settings'


describe "base get route json" do 
    

    before(:all) do 
        ActiveRecord::Base.establish_connection(TEST_CREATE_DATABASE_DETAILS)
        ActiveRecord::Base.connection.create_database(TEST_DATABASE_DETAILS[:database])

        ActiveRecord::Base.establish_connection(TEST_DATABASE_DETAILS) 
        ActiveRecord::MigrationContext.new('db/migrate', ActiveRecord::SchemaMigration).migrate
    end

    after(:all) do 
        ActiveRecord::Base.establish_connection(TEST_CREATE_DATABASE_DETAILS)
        ActiveRecord::Base.connection.drop_database(TEST_DATABASE_DETAILS[:database])
    end

    it "Correct Details. Returns a 201 response code with the user details in the body" do

        body = { "email" => "paul@paul.com", "username" => "paul", "password" => "paulPassword" }
        h = { 'Content-Type' => 'application/json' }
        post "/users", body.to_json, h
        body.delete("password")

        # confirm whether the status code and the body are what we expect
        last_response.status.should == 201
        JSON.parse(last_response.body).should == body

    end

    it "Create user with existing email. Should return 409 response" do
        body = { "email" => "paul@paul.com", "username" => "paul1", "password" => "paulPassword" }
        h = { 'Content-Type' => 'application/json' }
        expected_response = {"error" => "user with email #{body["email"]} already exists"}
        post "/users", body.to_json, h

        last_response.status.should == 409
        JSON.parse(last_response.body).should == expected_response
    end

    it "Create user with existing username. Should return 409 response" do
        body = { "email" => "paul1@paul.com", "username" => "paul", "password" => "paulPassword" }
        h = { 'Content-Type' => 'application/json' }
        expected_response = {"error" => "user with username #{body["username"]} already exists"}
        post "/users", body.to_json, h

        last_response.status.should == 409
        JSON.parse(last_response.body).should == expected_response
    end

    it "Gets all users in the database. Expect 200 code and 1 user" do
        get "/users"
        
        last_response.status.should == 200
        JSON.parse(last_response.body).length.should == 1
    end

end