post '/rounds/:round_id/guesses' do
  content_type :json
  clean_params(params)
  
  @guess = Guess.create(params)
  @guess.correct? ? correct_answer : wrong_answer

  @round = Round.find(params[:round_id])
  @card  = @round.play_card
  
  {card: @card, round: @round, correct: @guess.correct?, 
   message: session_message}.to_json
end

