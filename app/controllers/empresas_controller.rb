class EmpresasController < ApplicationController

  def index
    @empresas= Empresa.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @empresas}
    end
  end

  def show
      @empresa = Empresa.find(params[:id])
  end

  def new
      @empresa = Empresa.new
  end

  def edit
      @empresa  = Empresa.find(params[:id])
  end

  def create
      @empresa  = Empresa.new(params[:empresa])
      render :action => :new unless @empresa.save
  end

  def update
      @empresa  = Empresa.find(params[:id])
      render :action => :edit unless @empresa.update_attributes(params[:empresa])
  end

  def destroy
      @empresa  = Empresa.find(params[:id])
      @empresa .destroy
  end
  
end