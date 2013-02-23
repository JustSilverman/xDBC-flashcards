
get '/rounds/new' do
  @decks = Deck.all
  erb :show_decks
end


post '/rounds' do
  @deck = Deck.find(params[:id])
  @round = Round.new(:deck_id => @deck.id)
  puts @round
  if @round.save
    redirect "/rounds/#{@round.id}"
  else
    redirect '/'
  end
end


get '/rounds/:id' do
  @round = Round.find(params[:id])
  erb :show_round
end


get '/rounds/:id/play_card' do
  @round = Round.find(params[:id])
  @card  = @round.play_card
  puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  puts @card
  erb :show_card
end


