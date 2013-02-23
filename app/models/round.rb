class Round < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user
  has_many :guesses

  def play_card
    card = Card.find_by_id(unplayed_card_ids.sample)
    
    complete! if played_count + 1 == self.deck.count
    card
  end

  def played_count
    played_card_ids.count
  end

  def unplayed_count
    unplayed_card_ids.count
  end

  def percent_correct
    Guess.where(correct: true).count / Guess.where("attempt IS NOT NULL").count
  end

  def complete?
    self.complete
  end

  private
  def played_card_ids
    Card.select(:id).includes(:guesses).
                     where(:guesses => { :round_id => r.id} ).
                     where("attempt IS NOT NULL")
  end

  def unplayed_card_ids
    deck_ids = Card.select(:id).where(:deck_id => r.deck.id)
    unplayed_ids = deck_ids - played_card_ids
  end

  def complete!
    update_attributes(:complete => true)
  end
end
