
module IntakeValidation

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