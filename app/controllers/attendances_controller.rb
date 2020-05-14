class AttendancesController < ApplicationController
  def new
    @attendances = Attendance.all
  end

  def create 
    @attendance = Attendance.new(strip_customer_id: '5489', user_id: current_user.id, event_id: params[:format])

    if @attendance.save 
      flash[:success] = "Vous êtes inscrit pour cet évènement."
      redirect_to event_path(params[:format])
    else
      flash[:echec] = "Vous n'êtes pas inscrit pour cet évènement, veuillez ré-essayer."
      redirect_to event_path(params[:format])
    end
  end
end
