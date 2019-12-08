class Hashtag < ApplicationRecord
    include Filterable

    scope :starts_with, -> (name) { where("name like ?", "\##{name}%")}

    validates_presence_of :name

    has_many :tweets
end
