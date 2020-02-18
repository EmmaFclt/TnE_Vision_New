module ApplicationHelper

  def budget_alert(sum_amount_per_month)
    if sum_amount_per_month > 5000
        overdue = (sum_amount_per_month - 5000) / (sum_amount_per_month.to_f) * 100
        puts sum_amount_per_month
        puts overdue
        flash.now[:notice] = "-Vous avez depassé votre budget de #{overdue.to_i}%"
    end
  end
end
