require 'rails_helper'

RSpec.describe 'hashtags', :type => :request do
    it 'creates a hashtag' do
        post '/hashtags', :params => { :hashtag => { :name => 'Foo' }}

        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response).to have_http_status(:created)  
    end

    it 'returns a json response' do
        get '/hashtags'

        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response).to have_http_status(:success)
    end

    it 'deletes a hashtag' do
        hashtag = Hashtag.create!(name: "#foo")

        delete "/hashtags/#{hashtag.id}"

        expect(response).to have_http_status(:no_content)          
    end
end


