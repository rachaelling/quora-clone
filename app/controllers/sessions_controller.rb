get '/login' do
  erb :"static/login"
end

#create a new session (login)
# apply a authentication method to check if a user has entered a valid email and password
# if a user has successfully been authenticated, you can assign the current user id to a session
post '/login' do
  @user = User.find_by(email: params[:session][:email])
  if @user && @user.authenticate(params[:session][:password])
    session[:user_id] = @user.id
    # flash[:notice] = "Login Succesfull"
    redirect "/users/#{@user.id}"
  else
    # flash[:danger] = 'Incorrect email/password combination'
    redirect '/login'
  end
end

#destroy a session (logout)
# kill a session when a user chooses to logout, for example, assign nil to a session
# redirect to the appropriate page

post '/logout' do
  session[:user_id] = nil
  redirect "/signup"

end
