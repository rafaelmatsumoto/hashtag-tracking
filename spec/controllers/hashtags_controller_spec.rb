require 'rails_helper'

RSpec.describe HashtagsController, type: :controller do
    let(:hashtag) { Hashtag.create(name: "#svelte") }

    describe "GET index" do
        it "has a 200 status code" do
            get :index
            expect(response).to have_http_status(:success)
        end
    end

    describe "DELETE destroy" do
        let(:hashtag) { Hashtag.create(name: "#svelte") }

        it "has a 204 status code" do
            delete :destroy, params: { id: hashtag.id }
            expect(response).to have_http_status(:no_content)
        end
    end

    describe "filtering" do
        it "returns json containing svelte object" do
            get :index, params: { :hashtag_id => hashtag.id, :starts_with => "sve"}
            expect(response.body).to eq([hashtag].to_json)
        end

        it "returns an empty array" do
            get :index, params: { :hashtag_id => hashtag.id, :starts_with => "vue"}
            expect(response.body).to eq([].to_json)
        end
    end
    
end
