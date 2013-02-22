class UsersTable < ActiveRecord::Migration
  def change
    create_table :users do |c|
      c.string :first_name, :null => false
      c.string :last_name,  :null => false
      c.string :email,      :null => false
      c.string :password,   :null => false
      c.timestamps
    end
  end
end
