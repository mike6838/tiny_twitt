get '/' do
  # Look in app/views/index.erb
  if session[:user_id] = 2
    @current_user = User.find(session[:user_id])

    @twits_to_show = []
    @current_user.followees.each do |followee|
      @twits_to_show << followee.twits
    end
    @twits_to_show.flatten!
    #remember to sort by date asc
    erb :index
  else
  redirect '/login'
  end
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

