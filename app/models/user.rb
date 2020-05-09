
class User < ActiveRecord::Base
    validates :national_id, uniqueness: true
end