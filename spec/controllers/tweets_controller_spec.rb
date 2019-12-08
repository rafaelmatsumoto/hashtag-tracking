require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
    let(:hashtag) { Hashtag.create(name: "#svelte") }

    describe "responds to" do
        it "renders the tweets of the hashtag" do
            get :index, params: { :hashtag_id => hashtag.id }
            expect(response).to have_http_status(:success)
        end

        it "returns an error message" do
            get :index, params: { :hashtag_id => 2 }
            expect(response.body).to include("{\"error\":\"Couldn't find Hashtag with 'id'=2\"}")
        end
    end
end
