class CreateDeck < ActiveRecord::Migration
  def change
    create_table :decks do |c|
      c.string :topic, :null => false
      c.timestamps
    end
  end
end
