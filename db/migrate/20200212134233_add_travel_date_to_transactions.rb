class AddTravelDateToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :travel_date, :date
  end
end
