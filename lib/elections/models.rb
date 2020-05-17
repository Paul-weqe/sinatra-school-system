require 'data_mapper'

class Election
  include DataMapper::Resource
  
  property :id, Serial
  property :name, String
  property :voting_is_closed, Boolean
  property :winner_id, Integer
  property :winner_name, String 
  property :winner_national_id, String
end

DataMapper.finalize
