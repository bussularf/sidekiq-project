class SendReportJob < ApplicationJob
  queue_as :default

  def perform(user, subject, body)
    ReportMailer.send_report(user, subject, body).deliver_now
  end
end
