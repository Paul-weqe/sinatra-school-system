require 'data_mapper'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String 
  property :first_name, String
  property :last_name, String 
  property :password, String 

  property :is_admin, Boolean, default: false
  property :is_student, Boolean
  property :is_teacher, Boolean, default: false
end

DataMapper.finalize

