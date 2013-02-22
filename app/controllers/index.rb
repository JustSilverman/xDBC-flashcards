
# before do 
#   @rounds = Round.all ||= []
# end


get '/' do
  @rounds = Round.all
  @guesses = @rounds.guesses
  
  erb :index
end
