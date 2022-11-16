class ProductsController < ApplicationController
  def index
    @products = Product.all.with_attached_images
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @product.images.attach(params[:images])
  end

  def create 
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def delete
  end

  private
  def product_params
    params.require(:product).permit(:name, :quantity, :price, :cart_id, images: [])
  end
end
