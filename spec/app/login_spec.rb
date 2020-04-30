require File.expand_path 'spec/helpers/spec_helper.rb'
require 'json'
require 'active_record'
require 'dotenv'
require_relative 'database_settings'

describe "test for login" do
    login_url = "/user/login"

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
    
    it "tries to get a user that does not exist in the database" do
        body = { "email" => "paul1@paul.com", "username" => "paul", "password" => "paulPassword" }
        h = { 'Content-Type' => 'application/json' }
        post "/user/login", body.to_json, h

        # expected_response = {"error" => "email or password entered is incorrect. Please try again"}
        # JSON.parse(last_response.body).should == expected_response
        # last_response.status.should == 401
    end

    it "create user and try to validly get from the database" do 
        u = User.new
        u.email     = "paul@paul.com"
        u.password  = "paulPassword"
        u.username = "paul"
        u.save

        body = { "email" => "paul@paul.com", "password" => "paulPassword" }
        h = { 'Content-Type' => 'application/json' }
        post "/user/login", body.to_json, h
        
        expected_response = {"email" => "paul@paul.com", "username" => "paul"}
        JSON.parse(last_response.body).should == expected_response
        last_response.status.should == 200

    end

    
end