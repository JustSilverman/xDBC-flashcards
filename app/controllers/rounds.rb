
get '/rounds' do
  @decks = Deck.all
  erb :show_decks
end



get 'rounds/:id' do
  @deck = Deck.find(params[:id])
  @round = Round.new(@deck.id)
  if @round.save
    erb :show_round
  else
    redirect '/'
  end
end


get 'rounds/:id/play_card' do
  @round = Round.find(params[:id])
  @deck  = @round.deck_id
  @card  = deck.cards.find {|card| card.guess == false}
  erb :show_card
end


