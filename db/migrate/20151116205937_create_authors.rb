class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.timestamps null: false
			t.string :name
			t.string :party
    end

    create_table :authors do |t|
      t.timestamps null: false
			t.string :name
      t.belongs_to :candidate, :foreign_key => 'candidate_id'
    end

    create_table :issues do |t|
      t.timestamps null: false
			t.string :name
    end

    create_table :tweets do |t|
      t.timestamps null: false
			t.string :htags
			t.integer :num_favorites
			t.integer :num_retweets
			t.string :text
      t.belongs_to :author, :foreign_key => 'author_id'
    end

  end
end
