class HashtagsController < ApplicationController
    before_action :set_hashtag, only: [:destroy]

    def index
        @hashtags = Hashtag.filter(params.slice(:starts_with))

        render json: @hashtags
    end

    def create
        @hashtag = Hashtag.new(hashtag_params)

        if @hashtag.save
            render json: @hashtag, status: :created
        else
            render json: @hashtag.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @hashtag.destroy
        head :no_content
    end

    private

    def set_hashtag
        @hashtag = Hashtag.find(params[:id])
    end

    def hashtag_params
        params.require(:hashtag).permit(:name)
    end
end
