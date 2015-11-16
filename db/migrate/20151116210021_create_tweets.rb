class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|

      t.timestamps null: false
			t.string :author_name 
			t.string :htags
			t.integer :num_favorites
			t.integer :num_retweets
			t.string :text
    end
  end
end
