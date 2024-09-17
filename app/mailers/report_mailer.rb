class ReportMailer < ApplicationMailer
  def send_report(user)
    @user = user
    mail(to: @user.email, subject: "Your Report")
  end
end
