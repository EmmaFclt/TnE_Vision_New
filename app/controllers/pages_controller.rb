class PagesController < ApplicationController

  def dashboard
    @company = current_user.company
    @transactions = @company.transactions
    # @entities = []
    # @transactions.each do |t|
    #   @entities.push(t.entity) unless @entities.include?(t.entity)
    # end

    # @services = []
    # @transactions.each do |t|
    #   @services.push(t.service) unless @services.include?(t.service)
    # end
    @entities = @transactions.map{|t| t.entity}.reject{|entity| entity.nil?}.uniq

    @services = @transactions.map{|t| t.service}.reject{|service| service.nil?}.uniq

    if params[:filter]

      if params[:filter][:compliancy] == '1'
        @transactions = @transactions.where(compliancy: true)
      end

      if params[:filter][:entity]
        @transactions = @transactions.where(entity: params[:filter][:entity])
      end

      if params[:filter][:service]
        @transactions = @transactions.where(service: params[:filter][:service])
      end

      if params[:filter][:start_date]
        @transactions = @transactions.where('start_date: >= params[:filter][:start_date]')
      end
    end

    @types = @transactions.group_by { |t| t.transaction_type }
                          .transform_values { |v| v.count }

    @travellers = @transactions.group_by{ |t| t.traveller_last_name }
                          .transform_values{|v| v.count }.sort_by{ |k, v| -v }[0..4].to_h


    @cities = @transactions.group_by{ |t| t.cities }
                          .transform_values{|v| v.count }.sort_by{ |k, v| -v }[0..4].to_h

    @transactions_count_week = @transactions.group_by_day_of_week(:start_date, format: "%a").count


  end


  def wellbeing

  end

  def behaviour

  end

  def budget

  end

  def rse

  end

  def profil

  end
end
