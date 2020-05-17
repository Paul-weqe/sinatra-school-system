module UserAuthentication
  require 'digest/md5'

  def create_user(fields)

    if validate_existing_fields(fields) != true
      return validate_existing_fields(fields)
    end

    is_strong_password = check_password_strength(fields[:password])
    is_valid_national_id = validate_national_id(fields[:national_id])

    if is_strong_password != true
      return is_strong_password
    elsif is_valid_national_id != true
      return is_valid_national_id
    end

    user = User.new
    user.national_id  = fields[:national_id]
    user.first_name   = fields[:first_name]
    user.last_name    = fields[:last_name]
    user.password     = Digest::MD5.hexdigest(fields[:password])
    user.save
    user
  end

  <<-doc
  checks if all the required fields are present in the data submitted.
  Makes sure that the fields are:
    1. Not blank (" ")
    2. Not null values (nil)
  doc
  def validate_existing_fields(fields)
    required_fields = [:national_id, :first_name, :last_name, :password]

    required_fields.each do |required_field|
      if fields.key?(required_field) == false
        return "Field #{required_field} is not present in the data"
      elsif fields[required_field].nil?
        return "Field #{required_field} cannot be nil"
      elsif fields[required_field].strip == ""
        return "Field #{required_field} cannot be left blank"
      end
    end

    true
  end

  <<-doc
  Check for various items when 
  doc
  def check_password_strength(password)
    if password.length < 8
      return "The length of the password cannot be less than 8 characters long"
    elsif password.index(/[^[:alnum:]]/) == nil
      return "The password must contain a special character(@, $, %, &)"
    end
    true
  end

  <<-doc
  check for national_id is only numbers
  doc
  def validate_national_id(national_id)
    if national_id.length != 6
      return "National ID should be 6 characters long"
    elsif !national_id.scan(/\D/).empty?
      return "National ID should contain only numbers"
    end
    true
  end
end

