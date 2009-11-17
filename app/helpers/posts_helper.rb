module PostsHelper
  def date_format_string
    "%A, %B %d %Y"
  end
  
  def drilldown?
    params[:action] == "show"
  end
  
  def link_or_show_title_for(post)
    drilldown? ? post.title : link_to(post.title, post_path(post))
  end
end
