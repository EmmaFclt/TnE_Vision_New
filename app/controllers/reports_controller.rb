require 'csv'

class ReportsController < ApplicationController

  def new
    @company = current_user.company
    @report = Report.new
  end

  def import
    @company = current_user.company
    filepath = params[:file].path
    csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }

    report = Report.create!(company: current_user.company, user: current_user, format: params[:format], submission_date: Date.today, source: params[:source])

    CSV.foreach(filepath, csv_options) do |row|
      # Here, row is an array of columns
      # if row[11] == 'TRUE'
      #   status = true
      # else
      #   status = false
      # end

      first_name = row[2].split(' ')[0]
      last_name = row[2].split(' ')[1]
      Transaction.create!(entity: row[0],
        department: row[9],
        traveller_first_name: first_name,
        traveller_last_name: last_name,
        traveller_email: "#{last_name}@heineken.com",
        amount: row[7],
        reservation_mode: row[8],
        supplier: row[10],
        transaction_type: row[5],
        report: report,
        compliancy: row[11] == 'TRUE',
        cities: row [12],
        service: row [13],
        start_date: row[3],
        end_date: row[4],
        countries: row[14]
      )

    end
      redirect_to root_path
  end

  def create
    @company = current_user.company
    @report = Report.new(report_params)

    @report.user = current_user
    @report.company = current_user.company
    p @report.valid?
    p @report.errors
    if @report.save
      set_transactions(@report)
      redirect_to root_path
      if @transactions_count_week > 5000
      @budget_alert = (@sum_amount_per_month-5000)/@sum_amount_per_month
      flash.now[:notice] = "Vous avez depasé votre budget de #{@budget_alert}"
      end
    else
      render :new
    end
  end

  def index
    @company = current_user.company
    #put filters for each KPI and/or add option search
  end

  def destroy
    @company = current_user.company
    @report = Report.find(params[:id])
    @report.destroy
  end
end
