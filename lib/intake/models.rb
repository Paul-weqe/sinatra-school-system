require 'data_mapper'

class Intake
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true
  
  property :month_number, Integer
  property :month_name, String
  
end

DataMapper.finalize

