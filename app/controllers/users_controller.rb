get '/users/new' do 
end

post '/users' do 
  @user = User.new(params)
  if @user.save
    redirect '/'
  else
    erb :index
  end
end

post '/login' do 
  @user = User.find_by_email(params[:email])
  if @user
    if @user.authenticate
      login(@user.id)
      redirect '/'
    end
  end

  session[:message] = "Invalid email or password"
  erb :index
end

delete '/logout' do 
  logout
  redirect '/'
end
