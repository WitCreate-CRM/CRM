class CortesiasController < ApplicationController

  def index
    @cortesias = Cortesia.all
    respond_to do |format|
      format.html 
      format.json { render json: @cortesias }
    end
  end

  def show
      @cortesia = Cortesia.find(params[:id])
  end

  def new
      @cortesia = Cortesia.new
  end

  def edit
      @cortesia = Cortesia.find(params[:id])
  end

  def create
      @cortesia = Cortesia.new(params[:cortesia])
      render :action => :new unless @cortesia.save
  end

  def update
      @cortesia = Cortesia.find(params[:id])
      render :action => :edit unless @cortesia.update_attributes(params[:cortesia])
  end

  def destroy
      @cortesia = Cortesia.find(params[:id])
      @cortesia.destroy
  end
  
end
