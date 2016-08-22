# write modultes in the concerns folder if you want the method to be usable for different models/controllers.  this method applies to controllers - it creates a filter that is looking for an active record. PS - HELPER methods should only really contain methods that affect views.

module CurrentCart
  private
    def find_cart
      @cart = Cart.find(session[:cart_id]) #session is only available while a user's browser is open
    rescue ActiveRecord::RecordNotFound  #rather than send us an error message that a cart does not exist, then execute the following lines and create one...
      @cart = Cart.create(user_id: current_user.id)
      session[:cart_id] = @cart.id
    end
end
