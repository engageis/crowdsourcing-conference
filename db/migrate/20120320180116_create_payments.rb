class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :payer_name
      t.string :payer_email
      t.string :city
      t.string :state
      t.string :payment_method
      t.decimal :total
      t.decimal :net_amount
      t.decimal :total_amount
      t.decimal :service_tax_amount
      t.decimal :backer_amount_tax
      t.string :payment_status
      t.string :service_code
      t.string :institution_of_payment
      t.datetime :payment_date
      t.text :key
      t.text :payment_token

      t.timestamps
    end
  end
end
