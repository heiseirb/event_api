class Client::EventsController < Client::ApplicationController
  before_action :set_client_event, only: [:show, :update, :destroy]

  # GET /client/events
  # GET /client/events.json
  def index
    @client_events = Client::Event.all
  end

  # GET /client/events/1
  # GET /client/events/1.json
  def show
  end

  # POST /client/events
  # POST /client/events.json
  def create
    @client_event = Client::Event.new(client_event_params)

    if @client_event.save
      render :show, status: :created, location: @client_event
    else
      render json: @client_event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /client/events/1
  # PATCH/PUT /client/events/1.json
  def update
    if @client_event.update(client_event_params)
      render :show, status: :ok, location: @client_event
    else
      render json: @client_event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /client/events/1
  # DELETE /client/events/1.json
  def destroy
    @client_event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_event
      @client_event = Client::Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_event_params
      params.fetch(:client_event, {})
    end
end
