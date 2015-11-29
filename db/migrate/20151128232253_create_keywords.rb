class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
        t.belongs_to :tweet, index:true
        t.string :keyword
        t.float :relevance
        t.float :score
        t.string :sentiment
        t.timestamps null: false
      end
  end
end
