class Round < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user
  has_many :guesses

  def play_card
    card = Card.find_by_id(unplayed_card_ids.sample)
    
    complete! if played_count == self.deck.count
    card
  end

  def played_count
    played_card_ids.count
  end

  def unplayed_count
    unplayed_card_ids.count
  end

  def accuracy_rate
    if self.played_count > 0
      self.guesses.find_all {|guess| guess.correct?}.count*100/self.played_count
    else 
      0
    end 
  end

  def complete?
    self.complete
  end

  private
  def played_card_ids
    Card.select(:id).includes(:guesses).
                     where(:guesses => { :round_id => self.id} ).
                     where("attempt IS NOT NULL")
  end

  def unplayed_card_ids
    deck_ids = Card.select(:id).where(:deck_id => self.deck.id)
    unplayed_ids = deck_ids - played_card_ids
  end

  def complete!
    update_attributes(:complete => true)
  end
end
