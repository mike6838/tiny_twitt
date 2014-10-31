get '/' do
  # Look in app/views/index.erb
  if session[:user_id]

    @current_user = User.find(session[:user_id])

    @twits_to_show = []
    @current_user.followees.each do |followee|
      @twits_to_show << followee.twits
    end
    @twits_to_show.flatten!
    erb :index
  else
  redirect '/login'
  end
end

get '/login' do
  if session[:user_id]
    redirect '/'
  end
  erb :login
end

post '/login' do
  session[:user_id] = User.find_by(:username => params[:username], :password => params[:password]).id
  redirect '/'
end

post '/signup' do
  u = User.create(username: params[:username],
              fname: params[:fname],
              lname: params[:lname],
              email: params[:email],
              password: params[:password])
  redirect '/login'
end

get '/profile/:id' do
  @current_user = User.find(params[:id])
  erb :profile
end

get '/twit/:id' do
  erb :twit
end

post '/twit/:id' do
  Twit.create(:content => params[:content], :user_id => params[:id])
  redirect "/profile/#{params[:id].to_s}"
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

