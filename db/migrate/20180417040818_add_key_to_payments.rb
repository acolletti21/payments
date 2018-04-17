class AddKeyToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :loan_id, :integer
  end
end
