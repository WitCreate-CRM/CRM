class TelefonosController < ApplicationController

  def index

    if params[:limit] == nil or params[:limit] <= "0" then
          params[:limit] = 10
    end

    @telefonos = Telefono.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
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

  private
 
  def sort_column
    Telefono.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
  
end