class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @user = current_user
    @comment.post = @post
    @comment.user = @user
    if @comment.save
      redirect_to post_path(@post)
    else
      flash[:alert] = "something went wrong!"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end

