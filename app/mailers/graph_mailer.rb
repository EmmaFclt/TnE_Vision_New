class GraphMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.graph_mailer.extract.subject
  #

  def extract
    @company = params[:company]
    @graph = params[:graph]
    @titre = params[:titre]
    @description = params[:description]
    @commentaire = params[:commentaire]
    mail(
      to: params[:email],
      subject: "Un collègue souhaite vous partager une information"
      )
  end
end
