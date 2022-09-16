require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(name: 'gonzalo')
  user.save
  post = Post.new(title: 'example', text: 'example', author: user)
  post.save
  like = Like.new(author: user, post:)

  it 'new like it valid' do
    expect(like).to be_valid
  end
end
