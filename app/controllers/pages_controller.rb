class PagesController < ApplicationController

  def dashboard
    @company = current_user.company
    @transactions = @company.transactions

    if params[:filter]

      if params[:filter][:compliancy] == '1'
        @transactions = @transactions.where(compliancy: true)
      end



    end
    @transactions_count = @transactions.count

    @types = @transactions.group_by { |t| t.transaction_type }
                          .transform_values { |v| v.count }

    @travellers = @transactions.group_by{ |t| t.traveller_last_name }
                          .transform_values{|v| v.count }.sort_by{ |k, v| -v }[0..4].to_h


    @cities = @transactions.group_by{ |t| t.cities }
                          .transform_values{|v| v.count }.sort_by{ |k, v| -v }[0..4].to_h

    @transactions_count_week = Transaction.group_by_day_of_week(:start_date, format: "%a").count

  end


  def wellbeing

  end

  def behaviour

  end

  def budget

  end

  def rse

  end
end
