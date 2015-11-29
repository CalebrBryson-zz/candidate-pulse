class CreateSentiments < ActiveRecord::Migration
  def change
    create_table :sentiments do |t|
      t.belongs_to :keyword, index:true
      t.float :relevance
      t.float :score
      t.timestamps null: false
    end
  end
end
