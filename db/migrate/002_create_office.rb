class CreateOffice < ActiveRecord::Migration[4.2]
  def change
    create_table :offices do |t|
      t.string :name, null: false
      t.text :description
    end
  end
end