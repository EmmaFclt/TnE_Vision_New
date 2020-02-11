class PagesController < ApplicationController

  def dashboard
    @company = current_user.company
    @transactions = @company.transactions
    @entities = []
    @transactions.each do |t|
      @entities.push(t.entity) unless @entities.include?(t.entity)
    end

    if params[:filter]

      if params[:filter][:compliancy] == '1'
        @transactions = @transactions.where(compliancy: true)
      end

      if params[:filter][:entity]

        @transactions = @transactions.where(entity: params[:filter][:entity])
      end

    end

    @types = @transactions.group_by { |t| t.transaction_type }
                          .transform_values { |v| v.count }

    @travellers = @transactions.group_by{ |t| t.traveller_last_name }
                          .transform_values{|v| v.count }.sort_by{ |k, v| -v }[0..4].to_h
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
