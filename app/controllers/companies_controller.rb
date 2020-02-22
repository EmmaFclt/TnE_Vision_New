class CompaniesController < ApplicationController

  def update
    Company.find(params[:id]).update(budget: params[:company][:budget].to_i)
    redirect_to budget_path
  end
end
