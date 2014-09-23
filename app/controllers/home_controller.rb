class HomeController < ApplicationController
  before_action :require_user, only: [:edit]

  def index
    @post = Post.order("created_at").last
    @nextpost = Post.order("created_at")[-2]
  end

  def show
  end

  def edit
  end
end
