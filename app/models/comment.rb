class Comment < ActiveRecord::Base
  belongs_to :post
  
  validates_presence_of :post, :name, :body
  validates_uniqueness_of :body
end
