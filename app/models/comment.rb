class Comment < ApplicationRecord
  belongs_to :author_id, class_name: 'User'
  belongs_to :post

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
