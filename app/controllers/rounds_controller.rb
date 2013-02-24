before do 
  session.delete(:message)
end

before /\/rounds.*/ do 
  logged_in
end

get '/rounds' do
  @rounds = current_user.rounds 
  erb :user_rounds
end

get '/rounds/new' do
  @decks = Deck.all
  erb :show_decks
end

post '/rounds' do
  @deck  = Deck.find(params[:id])
  @round = Round.new(:deck_id => @deck.id, :user_id => current_user.id)
  if @round.save
    redirect "/rounds/#{@round.id}"
  else
    redirect '/rounds'
  end
end

get '/rounds/:id' do
  @round = Round.find(params[:id])
  erb :show_round
end

get '/rounds/:id/play_card' do
  @round = Round.find(params[:id])
  @card  = @round.play_card
  if @card.nil?
    redirect '/rounds'
  else  
    erb :show_card
  end  
end
