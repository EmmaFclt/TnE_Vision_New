class AddBudgetToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :budget, :integer
  end
end
