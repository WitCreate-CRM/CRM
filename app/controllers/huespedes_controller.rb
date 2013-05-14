class HuespedesController < ApplicationController
  

  def index
    @huespedes = Huesped.all
    respond_to do |format|
      format.html 
      format.json { render json: @huespedes }
    end
  end

  def show
      @huesped = Huesped.find(params[:id])
  end

  def new
      @huesped = Huesped.new
  end

  def edit
      @huesped = Huesped.find(params[:id])
  end

  def create
      @huesped = Huesped.new(params[:huesped])
      render :action => :new unless @huesped.save
  end

  def update
      @huesped = Huesped.find(params[:id])
      render :action => :edit unless @huesped.update_attributes(params[:huesped])
  end

  def destroy
      @huesped = Huesped.find(params[:id])
      @huesped.destroy
  end
  
end