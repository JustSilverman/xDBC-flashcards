
post '/rounds/:round_id/guesses' do
  clean_params(params)
  @guess = Guess.create(params) ## pass card_id as hidden input

  if @guess.correct?
    session[:message] = "Great job"## Congrats message
  else
    session[:message] = "Sorry but your answer was wrong"
  end

  redirect "rounds/#{@guess.round_id}/play_card"
end

