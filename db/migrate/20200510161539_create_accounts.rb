class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :name, limit: 50
      t.decimal :balance_amount, precision: 8, scale: 2, default: 0.00
      t.string :password_digest

      t.timestamps
    end

    add_index :accounts, :name, unique: true
  end
end
