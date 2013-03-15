get '/' do
  # Look in app/views/index.erb
  if logged_in?
    redirect '/users'
  else
    erb :index
  end
end

get '/posts' do
  if logged_in?
   redirect '/users'
  else 
    @posts = Post.all
    erb :posts
  end
end

get '/new' do
  erb :new_post
end

post '/posts' do
  if logged_in?
    @user = User.find(session[:user_id])
    @post = Post.create(params[:post])
    @user.posts << @post

    modify_tags(params).each do |tag|
      if Tag.find_by_tag(tag)
        @post.tags << Tag.find_by_tag(tag)
      else
      @post.tags << Tag.create(:tag => tag)
      end
    end 
  end
  redirect '/posts'
end

get '/post/:post_id' do
  @post = Post.find(params[:post_id])
  erb :single_post
end

get '/tag/:tag_id' do
  @tag = Tag.find(params[:tag_id])
  erb :tags
end

post '/signup' do
  unless logged_in?
    @user = User.create(params[:user])
    login(@user.id)
  end
  redirect '/users'
  end

post '/login' do
  unless logged_in?
    @user = User.find_by_email(params[:email])
    @user.authenticate(params[:email], params[:password])
    login(@user.id)
  end
  redirect '/users'
end

get '/users' do
  if logged_in?
    @user = User.find(session[:user_id])
    erb :user
  else
    redirect '/'
  end
end

post '/logout' do
  session.destroy
  redirect '/'
end

get "/users/:user_id/posts" do
  @posts = Post.where("user_id = ?", params[:user_id])
  erb :posts
end
