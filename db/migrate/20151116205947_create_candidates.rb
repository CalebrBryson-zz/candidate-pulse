class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|

      t.timestamps null: false
			t.string :name
			t.string :party
    end
  end
end
