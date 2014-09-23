class PostsController < ApplicationController
  # actions :new, :create, :edit, :update, :show, :index
  before_action :require_user, except: [:show, :index]


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save!
    if @post.save
      flash[:success] = "Your Pick was posted!"
      redirect_to posts_path
    else
      flash[:error] = "There was a problem with your post."
      render :new
    end
  end

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Your Post was updated!"
      redirect_to post_path(@post)
    else
      flash[:error] = "There was a problem with your post."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
    flash[:success] = "Your Post was deleted!"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :image2, :image3)
  end
end
