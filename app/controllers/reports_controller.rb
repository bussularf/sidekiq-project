class ReportsController < ApplicationController
  def send_report
    user = User.find(params[:user_id])
    SendReportJob.perform_later(user)
    render json: { status: "Report job enqueued" }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
  end
end
