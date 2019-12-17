require 'rails_helper'

RSpec.describe 'hashtags', :type => :request do
    it 'creates a hashtag' do
        post '/hashtags', :params => { :hashtag => { :name => 'Foo' }}

        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response).to have_http_status(:created)  
    end
end


