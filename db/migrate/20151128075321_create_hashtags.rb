class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.belongs_to :tweet, index:true
      t.string :htag
      t.timestamps null: false
    end
  end
end
