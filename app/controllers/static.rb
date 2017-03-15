get '/' do
  if logged_in?
  redirect to "users/#{current_user.id}"
  else
  erb :"static/login"
  end
end
