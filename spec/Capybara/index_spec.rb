require 'rails_helper'

RSpec.describe 'bla bla', type: :request do
  it 'bla, bla' do
    visit '/'
    expect(page).to include('Julito')
  end
end
