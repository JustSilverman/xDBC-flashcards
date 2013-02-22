class Round < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses

  def play_card
    cards_where(false).sample
  end

  def played_count
    cards_where(true).count
  end

  def unplayed_count
    self.deck.count - cards_where(true).count
  end

  def complete!
    self.update_attributes(:complete => true)
  end

  private
  def cards_where(arg)
    arg ? played = "NOT" : played = ""
    ids = Guess.select(:card_id).where(:round_id => self.id).
                                 where("attempt IS #{played} NULL")
    Card.where(:id => ids)
  end
end
