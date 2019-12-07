class TweetsController < ApplicationController
    def index
        begin
            @tweets = Hashtag.find(params[:hashtag_id]).tweets
            render json: @tweets, status: :ok
        rescue ActiveRecord::RecordNotFound => e
            render json: {
                error: e.to_s
            }, status: :not_found
        end
    end

    private

    def hashtag_params
        params.permit(:hashtag_id)
    end
end
