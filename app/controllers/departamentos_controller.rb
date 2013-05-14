class DepartamentosController < ApplicationController

  def index
    @departamentos= Departamento.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @departamentos }
    end
  end

  def show
      @departamento = Departamento.find(params[:id])
  end

  def new
      @departamento = Departamento.new
  end

  def edit
      @departamento = Departamento.find(params[:id])
  end

  def create
      @departamento  = Departamento.new(params[:departamento])
      render :action => :new unless @departamento.save
  end

  def update
      @visita  = Departamento.find(params[:id])
      render :action => :edit unless @departamento.update_attributes(params[:departamento])
  end

  def destroy
      @departamento  = Departamento.find(params[:id])
      @departamento .destroy
  end
  
end