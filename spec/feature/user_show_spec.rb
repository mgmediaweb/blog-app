require 'rails_helper'

RSpec.describe 'Testing List of Users:', type: :feature do
  before do
    @user = User.create(
      name: 'User Demo',
      photo: 'myphoto.jpg',
      bio: 'Biography example'
    )
    3.times do |n|
      Post.create(author: @user, title: "Hello #{n}", text: 'This is my post')
    end

    visit root_path
  end

  it 'Found specific user' do
    expect(page).to have_content(@user.name)
  end

  it 'Found specific user image' do
    expect(page).to have_xpath("//img[@src='#{@user.photo}']")
  end

  it 'show cant of posts for the user' do
    expect(page).to have_content("Posts: #{@user.posts_counter}")
  end

  it 'show user information when clicked' do
    find("a[href='#{user_path(@user.id)}']").click
    expect(page).to have_content(@user.name)
  end
end
