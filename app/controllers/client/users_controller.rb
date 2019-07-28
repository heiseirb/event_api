class Client::UsersController < Client::ApplicationController
  before_action :set_user, only: %i(show update destroy)

  def index
    render json: params[:page] ? User.with_relation.page(page) : User.with_relation.all
  end

  def show
    render json: @user
  end

  def create
    render json: User.create!(create_user_params)
  end

  def update
    render json: @user.update!(update_user_params)
  end

  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.with_relation.find(params[:id])
  end

  def create_user_params
    params.fetch(:user, {}).permit(:name, :email, :role, :password, :password_confirmatio)
  end

  def update_user_params
    params.fetch(:user, {}).permit(:name, :email, :role)
  end
end
