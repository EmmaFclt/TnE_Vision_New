class Transaction < ApplicationRecord
  belongs_to :report

  validates :entity, :department, :traveller_first_name, :traveller_last_name, :amount, :supplier, :transaction_type, presence: true
end
