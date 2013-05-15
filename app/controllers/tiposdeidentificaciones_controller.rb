class TiposdeidentificacionesController < ApplicationController
  
  helper_method :sort_column, :sort_direction

  def index
    if params[:limit] == nil or params[:limit] <= "0" then
          params[:limit] = 10
    end 

    @tiposdeidentificaciones = Tiposdeidentificacion.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format|
      format.html
      format.json { render json: @tiposdeidentificaciones }
    end
  end

  def show
      @tiposdeidentificacion = Tiposdeidentificacion.find(params[:id])
  end

  def new
      @tiposdeidentificacion = Tiposdeidentificacion.new
  end

  def edit
      @tiposdeidentificacion = Tiposdeidentificacion.find(params[:id])
  end

  def create
      @tiposdeidentificacion = Tiposdeidentificacion.new(params[:tiposdeidentificacion])
      render :action => :new unless @tiposdeidentificacion.save
  end

  def update
      @tiposdeidentificacion = Tiposdeidentificacion.find(params[:id])
      render :action => :edit unless @tiposdeidentificacion.update_attributes(params[:tiposdeidentificacion])
  end

  def destroy
      @tiposdeidentificacion = Tiposdeidentificacion.find(params[:id])
      @tiposdeidentificacion.destroy
  end
  
 private
 
  def sort_column
    Tiposdeidentificacion.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
