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