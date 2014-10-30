get '/' do
  # Look in app/views/index.erb
  if session[:user_id]
    @current_user = User.find(session[:user_id])
    erb :index
  else
  redirect '/login'
  end
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do

end

post '/signup' do
  User.create(username: params[:username],
              fname: params[:fname],
              lname: params[:lname],
              email: params[:email],
              password: params[:password])
  @current_user = User.find(session[:user_id])
  redirect 'profile/:id'
end

get 'profile/:id' do
  erb :profile
end

get '/twit/:id' do
  erb :twit
end

