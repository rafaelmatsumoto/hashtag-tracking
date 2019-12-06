class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.text :text
      t.datetime :published_date

      t.timestamps
    end
  end
end
