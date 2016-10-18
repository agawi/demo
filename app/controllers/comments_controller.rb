class CommentsController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!, except: [:create]
  def create
    @comment = @post.comments.build(comment_params)
    if current_user
      @comment.update_attribute(:user_id, current_user.id)
    end
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
