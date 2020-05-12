class EventsController < ApplicationController
  before_action :authenticate_user, only: [:create, :new]
  before_action :gossip_user, only: [:edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
  end

  def show
  end
end
