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

    @cities = @transactions.group_by{ |t| t.cities }
                          .transform_values{|v| v.count }.sort_by{ |k, v| -v }[0..4].to_h

    @transactions_count_week = @transactions.group_by_day_of_week(:start_date, format: "%a").count
  end

  def wellbeing
    @company = current_user.company
  end

  def behaviour
    @company = current_user.company
  end

  def budget
    # array = Company.first.transactions.group_by { |t| t.start_date.month }.transform_values { |v| v.pluck(:amount) }.transform_values(&:sum).sort_by {|k, v| k}
    # array.each_with_index { |a, i| a[1] = array[i-1][1] + a[1] if i > 0 }.to_h
    # ref = { '1' => 'January', '2' => 'February', '3' => 'March', '4' => 'April', '5' => 'May', '6' => 'June', '7'=> 'July', '8' => 'August', '9' => 'September', '10' => 'October', '11' => 'November', '12' => 'December' }
    @company = current_user.company
    # @transactions = @company.transactions
    # amount_per_month = @transactions.group_by { |t| t.start_date.month }.transform_values { |v| v.pluck(:amount) }.transform_values(&:sum).sort_by {|k, v| k}
    # @sum_amount_per_month = amount_per_month.each_with_index { |a, i| a[1] = amount_per_month[i-1][1] + a[1] if i > 0 }.to_h.transform_keys(&:to_s).transform_keys{|k| ref[k]}
    # @total = @sum_amount_per_month.values.sum
  end

  def rse
    @company = current_user.company
  end

  def profil
    @company = current_user.company
    @resource ||= current_user
  end

  def addfavorite
    current_user.favorites.include?(params[:graph]) ? current_user.favorites.delete(params[:graph]) : current_user.favorites << params[:graph]
    current_user.save!
    # raise
    redirect_to :favorites
  end

  def favorites
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

    @cities = @transactions.group_by{ |t| t.cities }
                          .transform_values{|v| v.count }.sort_by{ |k, v| -v }[0..4].to_h

    @transactions_count_week = @transactions.group_by_day_of_week(:start_date, format: "%a").count

    ref = { '1' => 'January', '2' => 'February', '3' => 'March', '4' => 'April', '5' => 'May', '6' => 'June', '7'=> 'July', '8' => 'August', '9' => 'September', '10' => 'October', '11' => 'November', '12' => 'December' }
    @company = current_user.company
    @transactions = @company.transactions
    amount_per_month = @transactions.group_by { |t| t.start_date.month }.transform_values { |v| v.pluck(:amount) }.transform_values(&:sum).sort_by {|k, v| k}
    @sum_amount_per_month = amount_per_month.each_with_index { |a, i| a[1] = amount_per_month[i-1][1] + a[1] if i > 0 }.to_h.transform_keys(&:to_s).transform_keys{|k| ref[k]}
  end

  def sendmail
    GraphMailer.with(company: current_user.company).extract.deliver_now
  end
end
