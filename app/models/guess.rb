class Guess < ActiveRecord::Base
  belongs_to :card
  belongs_to :round

  before_create :cleanse_attempt
  before_create :check_answer

  def correct?
    self.correct
  end

  private
  def cleanse_attempt
    self.attempt = self.attempt.strip.chomp.downcase
  end

  def check_answer
    self.correct = (self.attempt == self.card.answer.strip.chomp.downcase)
    true
  end
end
