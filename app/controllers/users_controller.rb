get '/' do
  erb :login
end

post '/users' do 
  @user = User.new(params)
  if @user.save
    login(@user.id)
    redirect '/rounds'
  else
    erb :login
  end
end

post '/login' do 
  @user = User.find_by_email(params[:email])
  if @user
    if @user.authenticate(params[:password])
      login(@user.id)
      redirect '/rounds'
    end
  end

  @message = "Invalid credentials"
  erb :login
end

delete '/logout' do 
  logout
  redirect '/'
end
