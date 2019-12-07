class Tweet < ApplicationRecord
    validates_presence_of :text, :published_date, :hashtag_id

    belongs_to :hashtag
end
