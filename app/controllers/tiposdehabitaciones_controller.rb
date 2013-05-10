class TiposdehabitacionesController < ApplicationController
  
  def index
    @tiposdehabitaciones = Tiposdehabitacion.all
    respond_to do |format|
      format.html
      format.json { render json: @tiposdehabitaciones }
    end
  end

  def show
      @tiposdehabitacion = Tiposdehabitacion.find(params[:id])
  end

  def new
      @tiposdehabitacion = Tiposdehabitacion.new
  end

  def edit
      @tiposdehabitacion = Tiposdehabitacion.find(params[:id])
  end

  def create
      @tiposdehabitacion = Tiposdehabitacion.new(params[:tiposdehabitacion])
      render :action => :new unless @tiposdehabitacion.save
  end

  def update
      @tiposdehabitacion = Tiposdehabitacion.find(params[:id])
      render :action => :edit unless @tiposdehabitacion.update_attributes(params[:tiposdehabitacion])
  end

  def destroy
      @tiposdehabitacion = Tiposdehabitacion.find(params[:id])
      @tiposdehabitacion.destroy
  end
  
end
