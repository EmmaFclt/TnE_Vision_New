class Company < ApplicationRecord
  has_many :users
  has_many :reports
  has_many :transactions, through: :reports

  validates :name, presence: true
  validates :address, presence: true

  def transaction_types
    self.transactions.group_by { |t| t.transaction_type }.transform_values { |v| v.count }
  end
end
