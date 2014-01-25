class AddIssueSequenceToProject < ActiveRecord::Migration
  def change
    add_column :projects, :issue_sequence, :integer
  end
end
