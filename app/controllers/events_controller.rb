class EventsController < ApplicationController
  before_action :authenticate_user, only: [:create, :new]
  # before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
  end

  def create
    @event = Event.new(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location], admin_id: current_user.id)

    if @event.save 
      flash[:success] = "L'évènement a bien été créé."
      redirect_to event_path(@event.id)
    else
      flash[:echec] = "L'évènement n'a pas été créé, entrées incorrèctes"
      redirect_to new_event_path
    end
  end

  def show
  end

  private 

  def authenticate_user
    unless current_user
      flash[:echec] = "Connecte toi avant de créer ton évènement !"
      redirect_to new_user_session_path
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  # def set_user
  #   @user = User.find(params[:id])
  # end
end
