class Comment < ActiveRecord::Base
  belongs_to :post
  
  validates_associated :post
  validates_presence_of :name, :body
  
  before_validation do |comment|
    comment.name = "someone" if comment.name.blank?
  end
end