class HomesController < ApplicationController
  def index
    @products = Product.promoted  #refers to the product.rb class method
  end
end
