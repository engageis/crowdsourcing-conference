class AddPaymentReferencesInSubscriptions < ActiveRecord::Migration
  def change
    change_table :subscriptions do |t|
      t.references :payment
    end
  end
end
