class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :name
      t.float :value
      t.boolean :enabled, default: true
      t.boolean :only_once, default: true

      t.timestamps
    end

    add_index :coupons, :name, unique: true
  end
end
