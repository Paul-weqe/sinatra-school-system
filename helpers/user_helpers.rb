module UserAuthentication
  require 'digest/md5'

  def create_user(fields)
    validate_required_fields_result = validate_required_fields fields
    if validate_required_fields_result.class == String
      return validate_required_fields_result
    end


    validate_non_blank_fields_result = validate_non_blank_fields fields
    if validate_non_blank_fields_result.class == String
      return validate_non_blank_fields_result
    end
    
    create_user_database_entry_result = create_user_database_entry fields
  end

  <<-doc
  doc
  def validate_required_fields(fields)
    required_fields = ["national_id", "first_name", "last_name", "password", "confirm_password"]
    required_fields.each do |required_field|
      next if (fields.include?required_field)
      "Field #{required_field} is a required field"
    end

    if fields["password"]  != fields["confirm_password"]
      "The two passwords must be equal"
    end
  end

  <<-doc
  doc
  def validate_non_blank_fields(fields)

    required_fields = ["national_id", "first_name", "last_name", "password", "confirm_password"]
    required_fields.each do |required_field|
      if fields[required_field].strip.empty? == true
        "Field #{required_field} cannot be left blank"
      end
    end
  end

  <<-doc
  doc
  def create_user_database_entry(fields)
    user              = User.new
    user.national_id  = fields[:national_id]
    user.first_name   = fields[:first_name]
    user.last_name    = fields[:last_name]
    user.password     = Digest::MD5.hexdigest(fields[:password])
    user.save
  end

  def find_user_by_national_id_and_password(national_id, password)
    User.find_by national_id: national_id, password: Digest::MD5.hexdigest(password)
  end
end