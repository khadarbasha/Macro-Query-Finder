class UrlListController < ApplicationController
   #before_filter :is_admin
  def index
    user = User.find(current_user.id)
    @url_list = user.url_lists
  end
  def new
  end

end
