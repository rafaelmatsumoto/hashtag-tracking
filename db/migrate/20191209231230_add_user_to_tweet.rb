class AddUserToTweet < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :name, :string
    add_column :tweets, :username, :string
  end
end
