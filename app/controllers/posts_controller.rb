class PostsController < ApplicationController
  before_action :find_post, except :index

  def index
    @posts = Post.all
  end

  # def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit; end

  def update
    @post = Post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :date)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
