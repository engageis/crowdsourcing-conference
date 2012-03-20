class RenameColumnTypeToKindInSubscriptions < ActiveRecord::Migration
  def up
    rename_column :subscriptions, :type, :kind
  end

  def down
    rename_column :subscriptions, :kind, :type
  end
end
