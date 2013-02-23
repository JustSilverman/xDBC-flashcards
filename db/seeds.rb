require 'csv'

file = 'public/card_data/state_data.csv'
capitals = Deck.create(:topic => "Country Capitals")
CSV.foreach(file, :headers => true) do |card_data|
  data = Hash[card_data.to_a.map {|k, v| [k.to_sym, v]}]
  state    = data[:name].split(" ").last.capitalize
  question = "What is the capital of #{state}"
  capitals.cards.create(:question    => question,
                        :answer      => data[:capital])
end

file = 'public/card_data/trivial_pursuit_history.csv'
trivial_pursuit = Deck.create(:topic => "U.S. History")
CSV.foreach(file, :headers => true) do |card_data|
  data = Hash[card_data.to_a.map {|k, v| [k.to_sym, v]}]
  trivial_pursuit.cards.create(:question    => data[:question],
                               :answer      => data[:answer])
end

file = 'public/card_data/jeopardy.csv'
jeopardy = Deck.create(:topic => "Jeopardy")
CSV.foreach(file, :headers => true) do |card_data|
  data = Hash[card_data.to_a.map {|k, v| [k.to_sym, v]}]
  jeopardy.cards.create(:question    => data[:question],
                        :answer      => data[:answer])
end