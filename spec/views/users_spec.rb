require 'rails_helper'

RSpec.describe 'User page test', type: :request do
  it 'Get the response from index.' do
    get '/users/index'
    expect(response.body).to include('show of users')
  end

  it 'Get the response from show.' do
    get '/users/show'
    # expect(response).to have_http_status(200)
    expect(response).to render_template(:show)
  end
end
