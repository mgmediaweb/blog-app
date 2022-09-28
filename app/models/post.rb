class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :increment_post_counter
  after_destroy :decrement_post_counter

  def recent_comments
    comments.where(post_id: self).includes(:author).order('created_at DESC').limit(5)
  end

  private

  def increment_post_counter
    author.increment!(:posts_counter)
  end

  def decrement_post_counter
    author.decrement!(:posts_counter)
  end
end
