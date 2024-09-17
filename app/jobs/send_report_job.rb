class SendReportJob < ApplicationJob
  require_relative "../mailers/report_mailer"
  queue_as :default

  def perform(user)
    ReportMailer.send_report(user).deliver_now
  end
end
