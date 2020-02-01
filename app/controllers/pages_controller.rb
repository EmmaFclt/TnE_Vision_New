class PagesController < ApplicationController

  def dashboard
    @company = current_user.company
  end
end
