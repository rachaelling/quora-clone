get '/signup' do
  erb :"static/index"
end

# Create-create (Signup)
post '/signup' do
  @user = User.new(params[:user]) # params[user] = {username:abc, email:xyz}
  if @user.save
    session[:user_id] = @user.id
      redirect "/users/#{session[:user_id]}" #profile page
  else
    #  erb :"static/index" #index page
     redirect '/'
  end
end

# read-Show (View user profile)
get '/users/:id' do
  @user = User.find_by_id(params[:id])
  erb :"users/show"
end

#Update -edit(edit action)
patch '/users/:id' do
  @user = User.find_by_id(params[:id])
  if @user.update(params[:user])
  # @user.username = params[:user][:username]
  # @user.email = params[:user][:email]
  # @user.save
    redirect to "/users/#{session[:user_id]}"
  else
    @error = "unsuccessful"
    erb :"static/show"
  end
end

# Delete (Delete user)
delete '/users/:id' do
 @user = User.find_by_id(params[:id])
 @user.destroy
 redirect to "/signup"
end
