class AddYearToTransactions < ActiveRecord::Migration[5.2]
  def change
      add_column :transactions, :year, :integer
  end
end
