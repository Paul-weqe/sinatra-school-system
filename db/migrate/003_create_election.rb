class CreateElection < ActiveRecord::Migration[4.2]
  def change
    create_table :elections do |t|

      t.string :name, null: false
      t.references :office
      t.string :office_name
      t.boolean :voting_is_closed
      t.integer :winner_id
      t.string :winner_name
      t.string :winner_national_id
      
    end
  end
end
