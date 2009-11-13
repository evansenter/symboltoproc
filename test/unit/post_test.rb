require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "all_grouped_by_date" do
    Post.destroy_all
    
    post_from_today_1 = Post.create(:title => "Anything.", :body => "Anything.")
    post_from_today_2 = Post.create(:title => "Anything.", :body => "Anything.")
    
    (post_from_yesterday_1 = Post.create(:title => "Anything.", :body => "Anything.")).update_attribute(:created_at, Time.now - 1.day)
    (post_from_yesterday_2 = Post.create(:title => "Anything.", :body => "Anything.")).update_attribute(:created_at, Time.now - 1.day)
    
    (post_from_hella_ago_1 = Post.create(:title => "Anything.", :body => "Anything.")).update_attribute(:created_at, Time.now - 1.month)
    (post_from_hella_ago_2 = Post.create(:title => "Anything.", :body => "Anything.")).update_attribute(:created_at, Time.now - 1.month)
    
    assert_equal [
      [
        post_from_today_1.created_at.to_date,
        [
          post_from_today_2,
          post_from_today_1
        ]
      ],
      [
        post_from_yesterday_1.created_at.to_date,
        [
          post_from_yesterday_2,
          post_from_yesterday_1
        ]
      ],
      [
        post_from_hella_ago_1.created_at.to_date,
        [
          post_from_hella_ago_2,
          post_from_hella_ago_1
        ]
      ]
    ], Post.all_grouped_by_date
  end
end
