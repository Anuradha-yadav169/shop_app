class AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def show
    @address = Address.find(params[:id])
  end

  def new 
    @address = Address.new 
  end 

  def create 
    @address = Address.new(address_params)
    if @address.save
      redirect_to @address
    else 
      render :new 
    end
  end

  def edit
    @address = Address.find(params[:id])
  end
    
  def update   
    @address = Address.find(params[:id])   
    if @address.update(address_params)   
      flash[:notice] = 'updated!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to edit address!'   
      render :edit   
    end   
  end 

  private 

  def address_params
    params.require(:address).permit(:first_name, :last_name, :postal_code, :city, :country, :phone, :email)
  end
end
