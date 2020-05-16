module OfficeHelper

  def create_office(name, description=nil)
    if name.nil?
      "The office must have a name init"
    end

    office              = Office.new
    office.name         = name
    office.description  = description
    office.save
    office
  end

  <<-doc
  A couple of rules:
    1. The office name cannot be numbers only
    2. The office name cannot start with a number
    3. The office name must be more thatn 3 characters long
  doc
  def validate_office_name(name)
    
  end

end