
put 'guesses' do
  @guess = Guess.new(params) ## pass card_id as hidden input
  @card = Card.find(@guess.card_id)
  if @guess.attempt.downcase == @card.answer.downcase
    @guess.update_attributes(:correct =>true)
    session[:message] = "Great job"## Congrats message
  else
    ## Fail message
    session[:message] = "Sorry but your answer was wrong"
  end

  redirect "rounds/#{@guess.round_id}/play_card"
end
