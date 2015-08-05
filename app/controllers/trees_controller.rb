class TreesController < ApplicationController
  before_action :set_event, only: [:new, :create]

  def new
    @tree = Tree.new
  end

  def create
    @tree = Tree.create(tree_params.merge({user_id: session[:user_id], event_id: @event.id}))

    respond_to do |format|
      if @tree
          # Tell the Mailer to send a welcome email after save
          PledgeMailer.welcome_email.deliver_later
   
          format.html { redirect_to(@user, notice: 'Pledge was successfully created.') }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

    redirect_to @event, notice: "An email is waiting in your inbox thanking you for your contribution. You're tree-mendous!"
  end

  private
  def tree_params
  	params.require(:tree).permit(:rand_given)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
