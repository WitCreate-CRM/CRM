class AlimentosController < ApplicationController

  def index
    @alimentos = Alimento.all
    respond_to do |format|
      format.html 
      format.json { render json: @alimentos }
    end
  end

  def show
      @alimento = Alimento.find(params[:id])
  end

  def new
      @alimento = Alimento.new
  end

  def edit
      @alimento = Alimento.find(params[:id])
  end

  def create
      @alimento = Alimento.new(params[:alimento])
      render :action => :new unless @alimento.save
  end

  def update
      @alimento = Alimento.find(params[:id])
      render :action => :edit unless @alimento.update_attributes(params[:alimento])
  end

  def destroy
      @alimento = Alimento.find(params[:id])
      @alimento.destroy
  end
  
end