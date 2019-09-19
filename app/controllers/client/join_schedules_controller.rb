class Client::JoinSchedulesController < Client::ApplicationController
  before_action :set_user, only: %i(index show destroy)

  def index
    render json: @user.join_schedules
  end

  def show
    join_schedule = @user.join_schedules.find(params[:id])
    render json: join_schedule
  end

  def destroy
    begin
      user_to_event_schedule =  @user.user_to_event_schedules.find_by(event_schedule_id: params[:id])
      user_to_event_schedule.destroy
    rescue => e
      puts e
      result = 'Error'
    else
      result = 'OK'
    end
    render json: result
  end

  private

  def set_user
    @user = User.with_relation.find(params[:user_id])
  end
end
