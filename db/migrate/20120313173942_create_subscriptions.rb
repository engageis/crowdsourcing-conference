class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.string :email
      t.string :type
      t.date :birthday
      t.string :company
      t.string :role
      t.string :phone
      t.string :phone_cell
      t.string :sex
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
