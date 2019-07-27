class Client::User::PasswordsController < ApplicationController
  def update
    user = User.find(user_id)
    return head :unauthorized unless user.authenticate(params[:current_password])

    user.update!(password_params)
    head :ok
  end

  private

  def password_params
    params.fetch(:user, {}).permit(:password, :password_confirmation)
  end
end
