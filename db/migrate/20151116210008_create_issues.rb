class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|

      t.timestamps null: false
			t.string :name
    end
  end
end
