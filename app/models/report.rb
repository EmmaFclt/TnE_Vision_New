class Report < ApplicationRecord
  has_many :transactions, dependent: :destroy
  belongs_to :company
  belongs_to :user

  validates :format, presence: true
  validates :submission_date, presence: true
  validates :source, presence: true
end
