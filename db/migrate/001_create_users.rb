
class CreateUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.string :email, unique: true
      t.string :username, unique: true
      t.string :password
    end
  end
end

<<-DOC
u = User.new
u.username = 'paul'
u.email = 'paul1tw1@gmail.com'
u.password = 'paulPassword'
u.save
DOC