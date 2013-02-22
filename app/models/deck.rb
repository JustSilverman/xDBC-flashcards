class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds

  def count
    self.cards.count
  end
end
