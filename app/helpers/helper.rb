helpers do

  def modify_tags(params)
    params[:tags][:tag].split(",").map! {|x| x.strip}
    end
  end
