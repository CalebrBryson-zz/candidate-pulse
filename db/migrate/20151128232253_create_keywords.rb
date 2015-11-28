class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
        t.belongs_to :tweet, index:true
        t.string :word
        t.string :sentiment
        t.float :relevance
        t.timestamps null: false
      end
  end
end
