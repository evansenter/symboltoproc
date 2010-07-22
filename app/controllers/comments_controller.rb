class CommentsController < ApplicationController
  before_filter :require_user, :only => :destroy
  
  def create
    valid_poster = params[:comment].delete(:human) == "1"
    @comment     = Post.find(params[:post_id]).comments.build(params[:comment])
    
    flash[:notice] = if valid_poster 
      @comment.save ? "Comment was successfully created." : "There was a problem with your comment."
    else
      "Silly robot! Comments are for humans!"
    end
    
    redirect_to @comment.post
  end

  def destroy
    redirect_to @comment.destroy.post
  end
end