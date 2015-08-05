class PledgesController < ApplicationController
  before_action :set_event, only: [:new, :create]

  def new
  	@pledge = Pledge.new
  end

  def create
    @user = User.find_by(email: user_params[:email])
  	@pledge = Pledge.create(pledge_params.merge({user_id: session[:user_id], event_id: @event.id}))
    
    respond_to do |format|
      if @pledge.save
        PledgeMailer.sample_email(@user).deliver_now

        redirect_to @event, notice: "An email is waiting in your inbox thanking you for your pledge. You're tree-mendous!" 
      else
        format.html { render action: 'new' }
        format.json { render json: @pledge.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def pledge_params
  	params.require(:pledge).permit(:about)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
