class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @user = User.find(params[:id])
    @rooms = @user.rooms   
  end

  def payment
  end 

  def add_card
    if current_user.stripe_id.blank?
      customer = Stripe::Customer.create(
        email: current_user.email
        )

      current_user.stripe_id = customer.id
      current_user.save
    else
      customer = Stripe::Customer.retrieve(current_user.stripe_id)
    end

    month, year = params[:expiry].split(/ \/ /)
    new_token = Stripe::Token.create(:card => {
      :number => params[:number],
      :exp_month => month,
      :exp_year => year,
      :cvc => params[:cvv]
    })

    customer.sources.create(source: new_token.id)

    flash[:notice] = 'Your card is saved'.
    redirect_to payment_method_path
  rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to payment_method_path

     
  end


 private

  
 def user_params
    params.require(:user).permit(:avatar)
    end
  end