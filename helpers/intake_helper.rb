
module IntakeValidation

  def create_intake intake_details
    return "None of the fiels 'name', 'month_name' and 'month_number' cannot be left blank" if (validate_required_fields(intake_details) != true)
    return "Field 'month_number' must be a number between 1 and 12" if (validate_intake_month_number(intake_details[:month_number]) != true)
    return "Field 'month_name' must be a valid month from 'January' to 'December'" if (validate_intake_month_name(intake_details[:month_name]) != true)
    intake              = Intake.new
    intake.name         = intake_details[:name]
    intake.month_number = intake_details[:month_number]
    intake.month_name   = intake_details[:month_name]
    intake.save
    intake
  end

  def validate_required_fields intake_details
    required_fields = [:name, :month_name, :month_number]
    required_fields.each do |required_field|
      return false if (intake_details.member? required_field) != true
    end
    true
  end

  def validate_intake_month_number month_number
    return false if month_number.class != Integer
    (1..12).member? month_number
  end

  def validate_intake_month_name month_name
    return false if month_name.class != String
    months = [
      "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
    ]
    months.member? month_name
  end
end