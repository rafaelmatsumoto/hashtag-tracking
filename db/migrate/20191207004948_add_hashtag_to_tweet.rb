class AddHashtagToTweet < ActiveRecord::Migration[6.0]
  def change
    add_reference :tweets, :hashtag, null: false, foreign_key: true
  end
end
