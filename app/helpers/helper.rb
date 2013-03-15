helpers do

  def modify_tags(params)
    params[:tags][:tag].split(",").map! {|x| x.strip}
  end

  def login(id)
    session[:user_id] = id
  end

  def logged_in?
    session.has_key?(:user_id)
  end


end

