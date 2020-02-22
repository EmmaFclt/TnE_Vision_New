class GraphMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.graph_mailer.extract.subject
  #
  # add_template_helper(bar_chart)
  def extract
    @company = params[:company]

    mail(
      to: "emma@tnevision.com",
      subject: "test"
      )
  end
end
