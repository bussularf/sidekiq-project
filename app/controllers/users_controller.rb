class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @system_notice = {
        class: "success",
        message: "Usuário criado com sucesso."
      }
    else
      @system_notice = {
        class: "danger",
        message: "Erro ao criar o usuário."
      }
    end
    redirect_to new_user_path, notice: @system_notice
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
