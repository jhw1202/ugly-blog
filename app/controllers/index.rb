get '/' do
  # Look in app/views/index.erb
  if logged_in?
    redirect '/users'
  else
    erb :index
  end
end

