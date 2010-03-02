class Post < ActiveRecord::Base
  validates_presence_of :title, :body
  
  def self.all_grouped_by_date
    all.group_by { |post| post.created_at.to_date }.sort_by(&:first).reverse.map do |post_date, posts|
      [post_date, posts.sort_by(&:id).reverse] 
    end
  end
end
