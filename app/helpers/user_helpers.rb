
module ValidateUserCreation

    def validate_user(fields)
        if check_fields_exist(fields).class == String
            puts check_fields_exist(fields)
        end
        
        if check_fields_type(fields).class == String
            puts check_fields_type(fields)
        end
    end

    # checks if all the fields that are compulsory are present in creation or editing of a user
    def check_fields_exist(fields)
        expected_fields = [:username, :email, :password]

        expected_fields.each  do |expected_field|
            if (fields.has_key?(:expected_field)) == false
                "#{:expected_field} is a required field"
            end
        end
    end

    # checks if the datatypes of the fields that have been entered are all correct
    def check_fields_type(fields)
        expected_fields = {:username => String, :email => String, :password => String}

        expected_fields.keys.each do |expected_field|
            if (fields[expected_field] != nil) && (fields[expected_field].class != expected_fields[expected_field])
                "#{expected_field} is supposed to be a #{expected_fields[expected_field]}"
            end
        end
    end


end
