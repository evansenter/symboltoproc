require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "ordered named_scope" do
    Post.destroy_all
    
    post_from_today_1 = Post.create(:title => "Anything.", :body => "Anything.")
    post_from_today_2 = Post.create(:title => "Anything.", :body => "Anything.")
    
    (post_from_yesterday_1 = Post.create(:title => "Anything.", :body => "Anything.")).update_attribute(:created_at, Time.now - 1.day)
    (post_from_yesterday_2 = Post.create(:title => "Anything.", :body => "Anything.")).update_attribute(:created_at, Time.now - 1.day)
    
    (post_from_hella_ago_1 = Post.create(:title => "Anything.", :body => "Anything.")).update_attribute(:created_at, Time.now - 1.month)
    (post_from_hella_ago_2 = Post.create(:title => "Anything.", :body => "Anything.")).update_attribute(:created_at, Time.now - 1.month)
    
    expected_post_order = [
      post_from_today_2, 
      post_from_today_1, 
      post_from_yesterday_2, 
      post_from_yesterday_1, 
      post_from_hella_ago_2, 
      post_from_hella_ago_1
    ]
    
    assert_equal expected_post_order, Post.ordered
  end
end
