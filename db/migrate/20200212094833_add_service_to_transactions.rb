class AddServiceToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :service, :string
  end
end
