class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  
  validates_presence_of :title, :body
  
  def self.all_grouped_by_date
    sorter = lambda { |a, b| b.to_date <=> a.to_date }
    
    all.group_by { |post| post.created_at.to_date }.sort { |a, b| b.first <=> a.first }.map do |post_date, posts|
      [
        post_date, 
        posts.sort { |a, b| b.id <=> a.id }
      ] 
    end
  end
end
