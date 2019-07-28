class Client::EventSchedulesController < Client::ApplicationController
  before_action :set_event_schedule, only: :update

  def create
    render json: EventSchedule.create!(schedule_params), include: '**'
  end

  def destroy
    @event_schedule.destroy
  end

  # 抽選
  def lottery
    render json: @event_schedule.lottery, include: '**'
  end

  # 申し込み
  def apply
    render json: event_schedule.users.create!(user_params), include: '**'
  end

  private

  def set_event_schedule
    @event_schedule = EventSchedule.find(params[:id])
  end

  def schedule_params
    params.fetch(:event_schedule, {}).permit(:event_id, :date, :capacity)
  end

  def user_params
    params.fetch(:user, {}).permit(:user_id)
  end
end
