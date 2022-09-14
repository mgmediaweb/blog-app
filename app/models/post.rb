class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def update_post_counter
    user.increment!(:posts_counter)
  end

  def recent_comments
    comments.where(post_id: self).order('created_at DESC').limit(5)
  end
end
