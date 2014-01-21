class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.text :body
      t.string :state
      t.datetime :closed_at
      t.references :user, index: true

      t.timestamps
    end
  end
end
