class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.decimal :payment_amount, precision: 8, scale: 2
      t.timestamps null: false
    end
  end
end
