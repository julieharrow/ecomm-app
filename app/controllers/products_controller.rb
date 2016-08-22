class ProductsController < ApplicationController
  include CurrentCart
  before_action :find_cart, only: [:line_item_create]
  before_action :authenticate_user!, except: :show
  before_action :check_for_admin!, except: [:show, :line_item_create]

  def line_item_create  #non-restful method. typically
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id) #before action :find_cart, need to associate the line item creation with a specific cart
    if @line_item.save
      redirect_to @cart
    else
      redirect_to @product
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params) #the active record method
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params) #the active record method
    if @product.save
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :stock, :price, :description, :promoted)
  end

  def check_for_admin!
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
