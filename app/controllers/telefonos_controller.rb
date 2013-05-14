class TelefonosController < ApplicationController

  def index
    @telefonos= Telefono.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @telefonos }
    end
  end

  def show
      @telefono= Telefono.find(params[:id])
  end

  def new
      @telefono = Telefono.new
  end

  def edit
      @telefono  = Telefono.find(params[:id])
  end

  def create
      @telefono  = Telefono.new(params[:telefono])
      render :action => :new unless @telefono.save
  end

  def update
      @telefono  = Telefono.find(params[:id])
      render :action => :edit unless @telefono.update_attributes(params[:telefono])
  end

  def destroy
      @telefono = Telefono.find(params[:id])
      @telefono .destroy
  end
  
end