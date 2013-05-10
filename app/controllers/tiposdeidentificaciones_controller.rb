class TiposdeidentificacionesController < ApplicationController
  
  def index
    @tiposdeidentificaciones = Tiposdeidentificacion.all
    respond_to do |format|
      format.html
      format.json { render json: @tiposdeidentificaciones }
    end
  end

  def show
      @tiposdeidentificacion = Tiposdeidentificacion.find(params[:id])
  end

  def new
      @tiposdeidentificacion = Tiposdeidentificacion.new
  end

  def edit
      @tiposdeidentificacion = Tiposdeidentificacion.find(params[:id])
  end

  def create
      @tiposdeidentificacion = Tiposdeidentificacion.new(params[:tiposdeidentificacion])
      render :action => :new unless @tiposdeidentificacion.save
  end

  def update
      @tiposdeidentificacion = Tiposdeidentificacion.find(params[:id])
      render :action => :edit unless @tiposdeidentificacion.update_attributes(params[:tiposdeidentificacion])
  end

  def destroy
      @tiposdeidentificacion = Tiposdeidentificacion.find(params[:id])
      @tiposdeidentificacion.destroy
  end
  
end
