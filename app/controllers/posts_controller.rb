class PostsController < ApplicationController
  before_filter :authorize_owner, :except => [:index, :show]
  before_filter :find_post,       :except => [:index, :new, :create]
  
  def index
    @post_groups = Post.all_grouped_by_date
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      flash[:notice] = "Post was successfully created."
      redirect_to(@post)
    else
      render :action => "new"
    end
  end

  def update
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post was successfully updated."
      redirect_to(@post)
    else
      render :action => "edit"
    end
  end

  def destroy
    @post.destroy
    
    redirect_to(posts_url)
  end
  
  private
  
  def authorize_owner
    (current_user.try(:info) || {})["screen_name"] == ENV["BLOG_OWNER"]
  end
  
  def find_post
    @post = Post.find(params[:id])
  end
end