class User < ApplicationRecord
  has_many :posts, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'

  def last_three_posts
    posts.where(user_id: self).order('created_at DESC').limit(3)
  end
end
