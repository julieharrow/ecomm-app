class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
  end

  def create
    @cart = Cart.create(user_id: current_user)
    if @cart.save
      redirect_to @cart
    else
      redirect_to request.referrer
    end
  end

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    redirect_to root_path, notice: 'Your cart is currently empty.'
  end

  def order_complete
    @cart = Cart.find(params[:cart_id])
    @amount = (@cart.subtotal.to_f.round(2) * 100).to_i

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => 'Tech Village customer',
      :currency => 'usd'
    )

    @cart.destroy

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
  end
end
