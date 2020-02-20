module ApplicationHelper

  def budget_alert(sum_amount_per_month, budget)
    if sum_amount_per_month > budget
        overdue = (sum_amount_per_month - budget) / (sum_amount_per_month.to_f) * 100
        puts sum_amount_per_month
        puts overdue
        flash.now[:notice] = "-Vous avez depassé votre budget de #{overdue.to_i}%"
    end
  end
end
