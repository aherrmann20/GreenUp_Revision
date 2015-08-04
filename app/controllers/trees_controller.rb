class TreesController < ApplicationController
  before_action :set_event, only: [:new, :create]

  def new
    @tree = Tree.new
  end

  def create
    @tree = Tree.create(tree_params.merge({user_id: session[:user_id], event_id: @event.id}))
      if @tree.save
        PledgeMailer.sample_email(@user).deliver_now

        format.html { redirect_to(@user, notice: 'Contribution was successfully donated.') }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
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
