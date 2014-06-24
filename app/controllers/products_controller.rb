class ProductsController < ApplicationController
  def index
  	@products = Product.all.order(created_at: :desc)
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
  	@product = Product.new(params[:id])
  end

  def create
  	@product = Product.new(product_params)
  	if @product
  		@product.save
  		redirect_to products_url
  	else
  		render :new
  	end
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def update
  	@product = Product.find(params[:id])
  	if @product.update_attributes(product_params)
  		redirect_to products_url(@product)
  	else
  		render :edit
  	end
  end

  def delete
  	@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to products_url
  end

  private
  def product_params
  	params.require(:product).permit(:name, :description, :price_in_cents)
  end
end
