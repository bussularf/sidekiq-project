class ReportMailer < ApplicationMailer
  def send_report(user, subject, body)
    @user = user
    @body = body

    mail(
      to: @user.email,
      subject: subject
    ) do |format|
      format.text { render plain: @body }
    end
  end
end
