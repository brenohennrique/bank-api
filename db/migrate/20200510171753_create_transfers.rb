class CreateTransfers < ActiveRecord::Migration[6.0]
  def change
    create_table :transfers do |t|
      t.references :source_account, null: false, foreign_key: { to_table: :accounts }
      t.references :destination_account, null: false, foreign_key: { to_table: :accounts }
      t.decimal :amount, precision: 8, scale: 2, null: false

      t.timestamps
    end
  end
end
