class Tweet < ApplicationRecord
    include Filterable

    scope :has_text, -> (text) { where("text like ?", "%#{text}%")}
    scope :hashtag_id, -> (hashtag_id) { where hashtag_id: hashtag_id }

    validates_presence_of :text, :published_date, :hashtag_id, :name, :username

    belongs_to :hashtag
end
