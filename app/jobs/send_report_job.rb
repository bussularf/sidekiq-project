class SendReportJob < ApplicationJob
  queue_as :default

  def perform(user)
    ReportMailer.send_report(user).deliver_now
  end
end
