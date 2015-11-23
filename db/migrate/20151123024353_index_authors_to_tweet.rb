class IndexAuthorsToTweet < ActiveRecord::Migration
  def change
    add_foreign_key :authors, :tweets
  end
end
