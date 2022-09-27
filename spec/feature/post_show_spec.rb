require 'rails_helper'

RSpec.describe 'Testing Post:', type: :feature do
  before do
    @user = User.create(
      name: 'User Demo',
      photo: 'myphoto.jpg',
      bio: 'Biography example'
    )
    @post = Post.create(author: @user, title: 'Post Title', text: 'This is my post')
    @comment = Comment.create(post: @post, author: @user, text: 'This is my comment')

    visit user_posts_path(@user.id, @comment.id)
  end

  it 'show posts title' do
    expect(page).to have_content(@post.title)
  end

  it 'show post author' do
    expect(page).to have_content(@post.author.name)
  end

  it 'show comments quantity in post' do
    expect(page).to have_content("Comments (#{@post.comments_counter})")
  end

  it 'show post likes' do
    expect(page).to have_content("Likes: #{@post.likes_counter}")
  end

  it 'show posts body' do
    expect(page).to have_content(@post.text)
  end

  it 'show username of coment' do
    expect(page).to have_content(@comment.author.name)
  end

  it 'show cant of posts' do
    expect(page).to have_content("Posts (#{@user.posts_counter})")
  end

  it 'show comment body' do
    expect(page).to have_content(@comment.text)
  end
end
