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

get 'profile/:id' do
  erb :profile
end

get '/twit/:id' do
  erb :twit
end

