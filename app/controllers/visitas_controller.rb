class VisitasController < ApplicationController

  def index
    @visitas= Visita.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @visitas }
    end
  end

  def show
      @visita = Visita.find(params[:id])
  end

  def new
      @visita = Visita.new
  end

  def edit
      @visita  = Visita.find(params[:id])
  end

  def create
      @visita  = Visita.new(params[:visita])
      render :action => :new unless @visita.save
  end

  def update
      @visita  = Visita.find(params[:id])
      render :action => :edit unless @visita.update_attributes(params[:visita])
  end

  def destroy
      @visita  = Visita.find(params[:id])
      @visita .destroy
  end
  
end