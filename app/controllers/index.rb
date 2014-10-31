require 'bcrypt'
get '/' do
  # Look in app/views/index.erb
  if session[:user_id] = 2
    current_user = User.find(session[:user_id])

    @twits_to_show = []
    current_user.followees.each do |followee|
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
  @user = User.find_by_username(params[:username])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    current_user
    redirect '/profile/:id'
  else
    redirect_to home_url
  end

end

# @user = User.new(params[:user])
# @user.password = params[:password]
# @user.save!

post '/signup' do
  @user = User.new(params[:user])
  @user.password = params[:password]
  @user.save!
  session[:user_id] = @user.id
  redirect 'profile/:id'
end

get 'profile/:id' do
  erb :profile
end

get '/twit/:id' do
  erb :twit
end

