class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :entity
      t.string :department
      t.string :traveller_first_name
      t.string :traveller_last_name
      t.string :traveller_email
      t.float :amount
      t.boolean :compliancy
      t.string :reservation_mode
      t.string :supplier
      t.string :transaction_type
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
