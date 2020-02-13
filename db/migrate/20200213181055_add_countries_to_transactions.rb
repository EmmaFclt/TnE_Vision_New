class AddCountriesToTransactions < ActiveRecord::Migration[5.2]
  def change
  add_column :transactions, :countries, :string
  end
end
