class EmailsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if params[:user_id].blank?
      @system_notice = {
        class: "danger",
        message: "Por favor, selecione um usuário antes de enviar o e-mail."
      }
    else
      @user = User.find(params[:user_id])
      subject = params[:subject]
      body = params[:body]

      SendReportJob.perform_later(@user, subject, body)

      @system_notice = {
        class: "success",
        message: "E-mail enviado com sucesso!"
      }
    end

    redirect_to root_path, notice: @system_notice
  end
end
