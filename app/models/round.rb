class Round < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user
  has_many :guesses

  def play_card
    get_cards(unplayed_card_ids).sample
    
    if played_count + 1 == self.deck.count
      complete!
      return nil
    end 
  end

  def played_count
    played_card_ids.count
  end

  def unplayed_count
    unplayed_card_ids.count
  end

  private
  def get_cards(ids)
    Card.where(:id => ids)
  end

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
