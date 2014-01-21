class AddDefaultValueToIssueState < ActiveRecord::Migration
  def change
    change_column_default :issues, :state, 'open'
  end
end
