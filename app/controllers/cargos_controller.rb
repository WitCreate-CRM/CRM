class CargosController < ApplicationController

  def index
    @cargos= Cargo.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cargos }
    end
  end

  def show
      @cargo = Cargo.find(params[:id])
  end

  def new
      @cargo = Cargo.new
  end

  def edit
      @cargo  = Cargo.find(params[:id])
  end

  def create
      @cargo   = Cargo.new(params[:cargo ])
      render :action => :new unless @cargo .save
  end

  def update
      @cargo   = Cargo.find(params[:id])
      render :action => :edit unless @cargo .update_attributes(params[:cargo ])
  end

  def destroy
      @cargo  = Cargo.find(params[:id])
      @cargo  .destroy
  end
  
end