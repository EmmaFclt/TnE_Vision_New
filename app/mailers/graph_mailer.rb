class GraphMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.graph_mailer.extract.subject
  #

  def extract
    @greeting = "Hi"

    mail to: "emma@tnevision.com", subject: "test"
  end
end
