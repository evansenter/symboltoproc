class CommentsController < ApplicationController
  before_filter :authorize_owner, :only => :destroy
  
  def create
    @comment       = Post.find(params[:post_id]).comments.build(params[:comment].merge(user_info))
    flash[:notice] = @comment.save ? "Post was successfully created." : "There was a problem with your comment."
    
    redirect_to @comment.post
  end

  def destroy
    redirect_to @comment.destroy.post
  end
  
  private
  
  def user_info
    {
      :name => current_user[:screen_name],
      :icon => current_user[:profile_image_url]
    }
  end
  
  def authorize_owner
    @comment = Comment.find(params[:id])
    
    unless admin? || current_user[:screen_name] == @comment.name
      flash[:notice] = "You do not have permission to do that."
      redirect_to post_path(@comment.post)
    end
  end
end