
# before do 
#   @rounds = Round.all ||= []
# end


get '/' do
  @rounds = Round.all
  erb :index
end
