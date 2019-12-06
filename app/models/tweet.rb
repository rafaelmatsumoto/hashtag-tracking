class Tweet < ApplicationRecord
    validates_presence_of :text, :published_date
end
