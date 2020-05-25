require 'rspec'
require_relative '../spec_helper.rb'
include IntakeValidation

describe "test validating month_name field for intake" do
  it "check if month_name is a string" do
    expect(validate_intake_month_name 10).to eq false
  end

  it "check if month_name is a valid name between 'January' to 'December'" do 
    expect(validate_intake_month_name "not valid month").to eq false
  end

  it "use a valid month_name" do
    expect(validate_intake_month_name "January").to eq true
  end
end

describe "test validating month_number field for Intake" do

  it "check input for month_number is not non-Integer value" do
    expect(validate_intake_month_number "this number").to eq false
  end

  it "check input for month_number is a valid month number(between 1 and 12)" do 
    expect(validate_intake_month_number 0).to eq false
  end

  it "try when the month_number is between an Integer 1 and 12" do
    expect(validate_intake_month_number 3).to eq true
  end
end

describe "test fields when creating intake" do
  it "try when not all the fields exist in the `intake_details`" do 
    # notice the :name field is missing so we expect the check 
    required_fields_response =  validate_required_fields({:month_name => "January", :month_number => 12})
    expect(required_fields_response).to eq false
  end

  it "try correctly. When all fields are included in `intake_details`" do
    required_fields_response =  validate_required_fields({:name => "January Intake", :month_name => "January", :month_number => 12})
    expect(required_fields_response).to eq true
  end

end

describe "check create intake" do

  after (:all) do 
    Intake.destroy!
  end

  it "create without all the valid fields" do
    # notice month name has been left out
    fields = {
      :name => "January Intake", :month_number => 1
    }
    expect(create_intake fields).to eq "None of the fiels 'name', 'month_name' and 'month_number' cannot be left blank"
  end

  it "create while keeping wrong data type for input field month_name" do 
    # notice the :month_name has been set to Integer instead of String
    fields = {
      :name => "January Intake", :month_number => 1, :month_name => 1
    }
    expect(create_intake fields).to eq "Field 'month_name' must be a valid month from 'January' to 'December'"
  end

  it "create while keeping wrong data type for input field month_number" do 
    # notice the :month_number has been set to String instead of Integer
    fields = {
      :name => "January Intake", :month_number => "1", :month_name => "January"
    }
    expect(create_intake fields).to eq "Field 'month_number' must be a number between 1 and 12"
  end

  it "create an intake with all valid fields" do
    fields = {
      :name => "January Intake", :month_number => 1, :month_name => "January"
    }
    expect(create_intake(fields).class).to eq Intake
    expect(Intake.count).to eq 1
  end
end