class Client::UsersController < Client::ApplicationController
  before_action :set_client_user, only: [:show, :update, :destroy]

  # GET /client/users
  # GET /client/users.json
  def index
    @client_users = Client::User.all
  end

  # GET /client/users/1
  # GET /client/users/1.json
  def show
  end

  # POST /client/users
  # POST /client/users.json
  def create
    @client_user = Client::User.new(client_user_params)

    if @client_user.save
      render :show, status: :created, location: @client_user
    else
      render json: @client_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /client/users/1
  # PATCH/PUT /client/users/1.json
  def update
    if @client_user.update(client_user_params)
      render :show, status: :ok, location: @client_user
    else
      render json: @client_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /client/users/1
  # DELETE /client/users/1.json
  def destroy
    @client_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_user
      @client_user = Client::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_user_params
      params.fetch(:client_user, {})
    end
end
