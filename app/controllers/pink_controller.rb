class PinkController < ApplicationController

  before_filter :confirm_logged_in
  
  def index
  end
  
  def list
    @posts = Post.all
  end

end
