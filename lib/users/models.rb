require 'data_mapper'

class User
  include DataMapper::Resource

  property :id, Serial
  property :national_id, String 
  property :first_name, String
  property :last_name, String 
  property :password, String 
  property :is_admin, Boolean, default: false
end

DataMapper.finalize