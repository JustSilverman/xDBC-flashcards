class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |c|
      c.text      :question, :null => false
      c.text      :answer, :null => false
      c.integer   :deck_id, :null => false
      c.timestamps
    end
  end
end
