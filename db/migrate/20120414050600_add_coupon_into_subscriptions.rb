class AddCouponIntoSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :coupon_name, :string
    add_index :subscriptions, :coupon_name
  end
end
