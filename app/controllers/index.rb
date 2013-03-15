get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/posts' do
  @posts = Post.all
  erb :posts
end

get '/new' do
  erb :new_post
end

post '/posts' do
  # raise params.inspect
  @post = Post.create(params[:post])
  modify_tags(params).each do |tag|
    @post.tags << Tag.create(:tag => tag)
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
  @user = User.create(params[:user])
end

post '/login' do

end
