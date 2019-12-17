require 'rails_helper'

RSpec.describe 'tweets', :type => :request do
    it 'returns a json response' do
        hashtag = Hashtag.create!(name: "#svelte")

        get "/hashtags/#{hashtag.id}/tweets"

        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response).to have_http_status(:success)
    end
end


