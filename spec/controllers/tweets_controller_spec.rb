require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
    let(:hashtag) { Hashtag.create(name: "#svelte") }
    let(:tweet) { Tweet.create(text: "Foo bar #svelte", published_date: "2019-08-07", hashtag_id: hashtag.id) }

    describe "responds to" do
        it "renders the tweets of the hashtag" do
            get :index, params: { :hashtag_id => hashtag.id }
            expect(response).to have_http_status(:success)
        end
    end

    describe "filtering" do
        it "returns svelte tweet" do
           get :index, params: { :hashtag_id => hashtag.id, :has_text => "bar"}
           expect(response.body).to eq([tweet].to_json)   
        end

        it "returns an empty array" do
            get :index, params: { :hashtag_id => hashtag.id, :has_text => "vue"}
            expect(response.body).to eq([].to_json)
        end
    end
end
