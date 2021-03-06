class EventsController < ApplicationController
  before_action :authenticate_user, only: [:create, :new]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
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
    @event = Event.find(params[:id])
  end

  private 

  def authenticate_user
    unless current_user
      flash[:echec] = "Connecte toi avant de créer ton évènement !"
      redirect_to new_user_session_path
    end
  end
end
