
class CreateUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.string :national_id, unique: true
      t.string :first_name
      t.string :last_name 
      t.string :password
    end
  end
end
