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

  def total
    ref = { '1' => 'January', '2' => 'February', '3' => 'March', '4' => 'April', '5' => 'May', '6' => 'June', '7'=> 'July', '8' => 'August', '9' => 'September', '10' => 'October', '11' => 'November', '12' => 'December' }
    transactions = self.transactions.where(year: 2020)
    amount_per_month = transactions.group_by { |t| t.start_date.month }.transform_values { |v| v.pluck(:amount) }.transform_values(&:sum).sort_by {|k, v| k}
    sum_amount_per_month = amount_per_month.each_with_index { |a, i| a[1] = amount_per_month[i-1][1] + a[1] if i > 0 }.to_h.transform_keys(&:to_s).transform_keys{|k| ref[k]}
    return sum_amount_per_month.values.last
  end

  def amount_per_month(year = 2020)
    ref = { '1' => 'January', '2' => 'February', '3' => 'March', '4' => 'April', '5' => 'May', '6' => 'June', '7'=> 'July', '8' => 'August', '9' => 'September', '10' => 'October', '11' => 'November', '12' => 'December' }
    transactions = self.transactions.where(year: year)
    amount_per_month = transactions.group_by { |t| t.start_date.month }.transform_values { |v| v.pluck(:amount) }.transform_values(&:sum).sort_by {|k, v| k}
    sum_amount_per_month = amount_per_month.each_with_index { |a, i| a[1] = amount_per_month[i-1][1] + a[1] if i > 0 }.to_h.transform_keys(&:to_s).transform_keys{|k| ref[k]}
    return sum_amount_per_month
  end
end

#amount_per_month = Company.last.transactions.group_by { |t| t.start_date.month }.transform_values { |v| v.pluck(:amount) }.transform_values(&:sum).sort_by {|k, v| k}
