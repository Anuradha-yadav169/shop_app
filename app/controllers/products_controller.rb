class ProductsController < ApplicationController
  before_action :set_categories
  # def index
  #   @products = Product.all.with_attached_images
  # end
  def index
    @products = Product.all
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

  def edit
    @product = Product.find(params[:id]) 
  end
    
  def update   
    @product = Product.find(params[:id])   
    if @product.update(product_params)   
      flash[:notice] = 'Product updated!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to edit product!'   
      render :edit   
    end   
  end 

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id, images: [])
  end

  def set_categories
    @categories = Category.all.order(:name)
  end
end
