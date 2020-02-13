class Company < ApplicationRecord
  has_many :users
  has_many :reports
  has_many :transactions, through: :reports

  validates :name, presence: true
  validates :address, presence: true

  def transaction_types
    self.transactions.group_by { |t| t.transaction_type }.transform_values { |v| v.count }
  end

  def top_5_travellers
    self.transactions.group_by{ |t| t.traveller_last_name }
                     .transform_values{|v| v.count }.sort_by{ |k, v| -v }[0..4].to_h
  end
end
