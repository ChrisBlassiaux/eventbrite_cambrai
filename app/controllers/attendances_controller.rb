class AttendancesController < ApplicationController
  def index
  end

  def new
    @attendances = Attendance.all
  end

  def create 
      # Amount in cents
    @event = Event.find(params[:format]).price
    @amount = @event * 100
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    @attendance = Attendance.new(strip_customer_id: customer.id, user_id: current_user.id, event_id: params[:format])
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: "Paiement de l'évènement",
      currency: 'eur',
    })

    if @attendance.save 
      flash[:success] = "Vous êtes inscrit pour cet évènement."
      redirect_to event_path(params[:format])
    end
  
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to event_path(params[:format])
  end
end
