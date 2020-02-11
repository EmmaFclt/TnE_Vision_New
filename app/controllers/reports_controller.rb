require 'csv'

class ReportsController < ApplicationController

  def new
    @report = Report.new
  end

  def import
    filepath = params[:file].path
    csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }

    report = Report.create!(company: current_user.company, user: current_user, format: params[:source], submission_date: Date.today, source: params[:source])

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
        compliancy: row[11] == 'TRUE'
      )

    end
      redirect_to root_path
  end

  def create
    @report = Report.new(report_params)

    @report.user = current_user
    @report.company = current_user.company
    p @report.valid?
    p @report.errors
    if @report.save
      set_transactions(@report)
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    #put filters for each KPI and/or add option search
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
  end
end
