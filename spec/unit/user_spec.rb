require 'rspec'
require_relative '../spec_helper.rb'
include UserAuthentication


describe "test for existing fields validation in helpers/user_helper.rb" do 
  it "test when one of the expected fields is nil" do 
    data =  {
      :national_id => nil, :first_name => "First", :last_name => "Last", :password => "Password"
    }
    message = validate_existing_fields(data)
    expect(message).to eq "Field national_id cannot be nil"
  end

  it "test when one of the required fields is blank" do 
    data = {
      :national_id => "", :first_name => "First", :last_name => "Last", :password => "Password"
    }
    message = validate_existing_fields(data)
    expect(message).to eq "Field national_id cannot be left blank"
  end

  it "test when one of the required fields is not present at all" do
    data = {
      :national_id => "1234412", :first_name => "First", :last_name => "Last"
    }
    message = validate_existing_fields(data)
    expect(message).to eq "Field password is not present in the data"
  end

  it "test when all the fields are present and there is no blank/nil fields" do
    data = {
      :national_id => "112233", :first_name => "First", :last_name => "Last", :password => "thispassword"
    }
    message = validate_existing_fields(data)
    expect(message).to eq true
  end
end

describe "test for password strength validation in helpers/user_helper.rb" do
  it "check password validation for password with less than 8 characters" do
    message = check_password_strength("pass")
    expect(message).to eq "The length of the password cannot be less than 8 characters long"
  end

  it "password validation when password has no special characters" do
    message = check_password_strength("thisispassword")
    expect(message).to eq "The password must contain a special character(@, $, %, &)"
  end

  it "password validation when password is > 8 characters long and has special characters" do 
    message = check_password_strength "thisP@ssw0rd"
    expect(message).to eq true
  end
end

describe "check validation for national id in helpers/user_helper.rb" do 
  it "enter national id with not exactly six characters" do 
    message = validate_national_id "123"
    expect(message).to eq "National ID should be 6 characters long"
  end

  it "enter national id with another character that is not a number" do
    message = validate_national_id "2113we"
    expect(message).to eq "National ID should contain only numbers"
  end

  it "test when national id is the correct length and has only numbers" do 
    message = validate_national_id "331122"
    expect(message).to eq true
  end
end
