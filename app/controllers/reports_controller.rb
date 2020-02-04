class ReportsController < ApplicationController

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.user = current_user
    @report.company = current_user.company
    p @report.valid?
    p @report.errors
    if @report.save
      # require 'csv'

      # filepath = 'transactions.csv'

      # CSV.foreach(filepath) do |row|
      # # Here, row is an array of columns
      #   Transacion.create(entity: #{row[0]} | #{row[2]} | #{row[2]} | #{row[3]} | #{row[4]} | #{row[6]} | #{row[7]} | #{row[8]} | #{row[9]} | #{row[10]}")
      # end


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


  private

  def report_params
    params.require(:report).permit(:format, :submission_date, :source, :file)
  end
end
