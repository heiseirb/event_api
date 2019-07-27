class Client::User::PasswordsController < ApplicationController
  before_action :set_client_user_password, only: [:show, :update, :destroy]

  # GET /client/user/passwords
  # GET /client/user/passwords.json
  def index
    @client_user_passwords = Client::User::Password.all
  end

  # GET /client/user/passwords/1
  # GET /client/user/passwords/1.json
  def show
  end

  # POST /client/user/passwords
  # POST /client/user/passwords.json
  def create
    @client_user_password = Client::User::Password.new(client_user_password_params)

    if @client_user_password.save
      render :show, status: :created, location: @client_user_password
    else
      render json: @client_user_password.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /client/user/passwords/1
  # PATCH/PUT /client/user/passwords/1.json
  def update
    if @client_user_password.update(client_user_password_params)
      render :show, status: :ok, location: @client_user_password
    else
      render json: @client_user_password.errors, status: :unprocessable_entity
    end
  end

  # DELETE /client/user/passwords/1
  # DELETE /client/user/passwords/1.json
  def destroy
    @client_user_password.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_user_password
      @client_user_password = Client::User::Password.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_user_password_params
      params.fetch(:client_user_password, {})
    end
end
