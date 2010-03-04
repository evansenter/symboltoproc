class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  
  validates_presence_of :title, :body
  
  named_scope :ordered, :order => "created_at DESC, id DESC"
end
