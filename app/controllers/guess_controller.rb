post '/rounds/:round_id/guesses' do
  clean_params(params)
  @guess = Guess.create(params) ## pass card_id as hidden input

  if @guess.correct?
    session[:message] = "Great job"## Congrats message
  else
    session[:message] = "Sorry but your answer was wrong"
  end
  @card  = Round.find(params[:round_id]).play_card

  content_type :json
  @card.to_json

  # redirect "rounds/#{@guess.round_id}/play_card"
end

