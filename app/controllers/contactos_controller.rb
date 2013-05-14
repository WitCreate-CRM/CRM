class ContactosController < ApplicationController

  def index
    @contactos= Contacto.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contactos }
    end
  end

  def show
      @contacto = Contacto.find(params[:id])
  end

  def new
      @contacto = Contacto.new
  end

  def edit
      @contacto = Contacto.find(params[:id])
  end

  def create
      @contacto  = Contacto.new(params[:contacto])
      render :action => :new unless @contacto.save
  end

  def update
      @contacto = Contacto.find(params[:id])
      render :action => :edit unless @contacto.update_attributes(params[:contacto])
  end

  def destroy
      @contacto  = Contacto.find(params[:id])
      @contacto .destroy
  end
  
end