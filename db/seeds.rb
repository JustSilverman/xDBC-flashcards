require 'csv'

file = 'public/card_data/state_data.csv'
capitals = Deck.create(:topic => "Country Capitals")
CSV.foreach(file, :headers => true) do |card_data|
  data = Hash[card_data.to_a.map {|k, v| [k.to_sym, v]}]
  capitals.cards.create(:question    => data[:name].capitalize,
                        :answer      => data[:capital])
end

Round.create(:deck_id => capitals.id)

Guess.new(:card_id => Card.find(3).id, :round_id => 1, :attempt => "franklin")
