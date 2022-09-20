require 'rails_helper'

RSpec.describe 'User page test', type: :request do
  it 'Get the response from index.' do
    get '/posts/index'
    # expect(response).to have_http_status(200)
    expect(response.body).to include('show of posts')
  end

  it 'Get the response from show.' do
    get '/posts/show'
    expect(response).to render_template(:show)
  end
end
