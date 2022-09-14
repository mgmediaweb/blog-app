class Like < ApplicationRecord
  belongs_to :author_id, class_name: 'User'
  belongs_to :post

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
