class Client::EventsController < Client::ApplicationController
  before_action :set_event, only: %i(show update destroy lottery)

  def index
    render json: params[:page] ? Event.with_relation.page(params[:page]) : Event.with_relation.all
  end

  def show
    render json: @event, include: '**'
  end

  def create
    render json: Event.create!(event_params)
  end

  def update
    render json: Event.update!(event_params)
  end

  def destroy
    @event.destroy
  end

  private

  def set_event
    @event = Event.with_relation.find(params[:id])
  end

  def event_params
    params.fetch(:event, {}).permit(:owner_id, :place, :description)
  end
end
