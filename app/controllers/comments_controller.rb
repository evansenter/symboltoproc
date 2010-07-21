class CommentsController < ApplicationController
  before_filter :require_user, :only => :destroy
  
  def create
    @comment       = Post.find(params[:post_id]).comments.build(params[:comment])
    flash[:notice] = @comment.save ? "Comment was successfully created." : "There was a problem with your comment."
    
    redirect_to @comment.post
  end

  def destroy
    redirect_to @comment.destroy.post
  end
end