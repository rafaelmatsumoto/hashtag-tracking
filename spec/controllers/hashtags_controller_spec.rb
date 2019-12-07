require 'rails_helper'

RSpec.describe HashtagsController, type: :controller do
    describe "GET index" do
        it "has a 200 status code" do
            get :index
            expect(response).to have_http_status(:success)
        end
    end

    describe "DELETE destroy" do
        it "has a 204 status code" do
            delete :destroy
            expect(response).to have_http_status(:no_content)
        end
    end
    
end
