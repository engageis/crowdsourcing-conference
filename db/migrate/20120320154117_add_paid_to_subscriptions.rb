class AddPaidToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :paid, :boolean, :null => false, :default => false
    add_column :subscriptions, :paid_at, :timestamp
  end
end
