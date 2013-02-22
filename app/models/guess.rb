class Guess < ActiveRecord::Base
  has_one    :card
  belongs_to :round
end
