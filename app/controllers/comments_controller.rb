class CommentsController < ApplicationController
  before_action :set_post
  def create
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end


  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :commenter)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
end
