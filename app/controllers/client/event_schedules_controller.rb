class Client::EventSchedulesController < Client::ApplicationController
  before_action :set_client_event_schedule, only: [:show, :update, :destroy]

  # GET /client/event_schedules
  # GET /client/event_schedules.json
  def index
    @client_event_schedules = Client::EventSchedule.all
  end

  # GET /client/event_schedules/1
  # GET /client/event_schedules/1.json
  def show
  end

  # POST /client/event_schedules
  # POST /client/event_schedules.json
  def create
    @client_event_schedule = Client::EventSchedule.new(client_event_schedule_params)

    if @client_event_schedule.save
      render :show, status: :created, location: @client_event_schedule
    else
      render json: @client_event_schedule.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /client/event_schedules/1
  # PATCH/PUT /client/event_schedules/1.json
  def update
    if @client_event_schedule.update(client_event_schedule_params)
      render :show, status: :ok, location: @client_event_schedule
    else
      render json: @client_event_schedule.errors, status: :unprocessable_entity
    end
  end

  # DELETE /client/event_schedules/1
  # DELETE /client/event_schedules/1.json
  def destroy
    @client_event_schedule.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_event_schedule
      @client_event_schedule = Client::EventSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_event_schedule_params
      params.fetch(:client_event_schedule, {})
    end
end
