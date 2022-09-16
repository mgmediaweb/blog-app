require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.new(name: 'gonzalo', posts_counter: 0)
  user.save
  post = Post.new(title: 'example', text: 'example', author: user)
  post.save
  comment = Comment.new(author: user, post:, text: 'example')

  it 'new comment it valid' do
    expect(comment).to be_valid
  end
end
