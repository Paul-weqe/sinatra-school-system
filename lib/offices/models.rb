require 'data_mapper'

class Office
  include DataMapper::Resource
  
  property :id, Serial
  property :name, String
  property :description, Text
end

DataMapper.finalize

