class ChargesController < ApplicationController
	before_action :get_user
	def new
	end

	def create
	  # Amount in cents
	  @amount = 500

	  # customer = Stripe::Customer.create(
	  #   :email => params[:stripeEmail],
	  #   :source  => params[:stripeToken]
	  # )

	  charge = Stripe::Charge.create(
	    :customer    => user.id,
	    :amount      => @amount,
	    :description => 'Mission42 participant',
	    :currency    => 'SGD'
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
end
