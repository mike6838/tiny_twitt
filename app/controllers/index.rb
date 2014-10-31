require 'bcrypt'
get '/' do
  # Look in app/views/index.erb
  if session[:user_id]
    current_user = User.find(session[:user_id])
    @twits_to_show = []
    current_user.followed_users.each do |followed|
      @twits_to_show << followed.twits
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

  @user = User.find_by_username(params[:username])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    current_user
    redirect "/profile/#{@user.id}"
  else
    redirect_to '/login'
  end
end


post '/signup' do
  @user = User.new(fname:params[:fname], lname:params[:lname], username:params[:username], email:params[:email])
  @user.password = params[:password]
  @user.save!
  session[:user_id] = @user.id
  redirect "/profile/#{@user.id}"
end

get '/profile/:id' do
  @user = User.find(params[:id])
  erb :profile
end

get '/twit/:id' do
  erb :twit
end

post '/twit/:id' do
  Twit.create(:content => params[:content], :user_id => params[:id])
  redirect "/profile/#{params[:id].to_s}"
end

post '/profile/:id/follow' do
  current_user.followed_users << User.find(params[:id])
  redirect "/profile/#{params[:id]}"
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

