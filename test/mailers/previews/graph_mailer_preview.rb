# Preview all emails at http://localhost:3000/rails/mailers/graph_mailer
class GraphMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/graph_mailer/extract
  def extract
    GraphMailer.extract
  end

end
