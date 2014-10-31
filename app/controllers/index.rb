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
  session[:user_id] = nil
  #authenticate a user
  @user = User.find_by(username: params[:username])

  if !@user.nil? && @user.authenticate(params[:password])
    puts "authenticated!!!"
    puts session[:user_id] = @user.id
    redirect 'profile/:id'
  else
    puts "Authentication FAILED"
    redirect '/login'
  end
end

post '/signup' do
  @user = User.create(username: params[:username],
              fname: params[:fname],
              lname: params[:lname],
              email: params[:email],
              password_hash: BCrypt::Password.create(params[:password]))
  session[:user_id] = @user.id
  redirect 'profile/:id'
end

get 'profile/:id' do
  erb :profile
end

get '/twit/:id' do
  erb :twit
end

