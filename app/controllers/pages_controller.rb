class PagesController < ApplicationController

  def dashboard
    @company = current_user.company
    @transactions = @company.transactions

    # if params[:filter]
    #   if params[:filter][:entity]
    #     @transactions = @transactions.where(entity: params[:filter][:entity])
    #   end
    # end

    @types = @transactions.group_by { |t| t.transaction_type }
                          .transform_values { |v| v.count }
  end
end
