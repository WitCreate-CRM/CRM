class PreferenciasController < ApplicationController
  

  def index
    @preferencias = Preferencia.all
    respond_to do |format|
      format.html 
      format.json { render json: @preferencias }
    end
  end

  def show
      @preferencia = Preferencia.find(params[:id])
  end

  def new
      @preferencia = Preferencia.new
  end

  def edit
      @preferencia = Preferencia.find(params[:id])
  end

  def create
      @preferencia = Preferencia.new(params[:preferencia])
      render :action => :new unless @preferencia.save
  end

  def update
      @preferencia = Preferencia.find(params[:id])
      render :action => :edit unless @preferencia.update_attributes(params[:preferencia])
  end

  def destroy
      @preferencia = Preferencia.find(params[:id])
      @preferencia.destroy
  end
  
end