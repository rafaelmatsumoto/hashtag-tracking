class TweetsController < ApplicationController
    def index
        begin
            @tweets = Tweet.filter(tweet_params)
            paginate json: @tweets, status: :ok, per_page: 15
        rescue ActiveRecord::RecordNotFound => e
            render json: {
                error: e.to_s
            }, status: :not_found
        end
    end

    private

    def tweet_params
        params.permit(:has_text, :hashtag_id).slice(:has_text, :hashtag_id)
    end
end
