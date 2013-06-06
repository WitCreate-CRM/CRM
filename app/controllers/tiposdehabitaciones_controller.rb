class TiposdehabitacionesController < ApplicationController
  
  before_filter :require_login
  
  helper_method :sort_column, :sort_direction

  def index
    if params[:limit] == nil or params[:limit] <= "0" then
          params[:limit] = 10
    end

    @tiposdehabitaciones = Tiposdehabitacion.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format|
      format.html
      format.json { render json: @tiposdehabitaciones }
    end
  end

  def show
      @tiposdehabitacion = Tiposdehabitacion.find(params[:id])
      
      respond_to do |format|
      format.js 
      format.pdf do
          pdf = TiposdehabitacionPdf.new(@tiposdehabitacion, view_context)
          send_data pdf.render, filename:
          "Tiposdehabitacion_#{@tiposdehabitacion.id}.pdf", type: "application/pdf"
        end
      end
  end

  def new
      @tiposdehabitacion = Tiposdehabitacion.new
  end

  def edit
      @tiposdehabitacion = Tiposdehabitacion.find(params[:id])
  end

  def create
      @tiposdehabitacion = Tiposdehabitacion.new(params[:tiposdehabitacion])
      render :action => :new unless @tiposdehabitacion.save
  end

  def update
      @tiposdehabitacion = Tiposdehabitacion.find(params[:id])
      render :action => :edit unless @tiposdehabitacion.update_attributes(params[:tiposdehabitacion])
  end

  def destroy
      @tiposdehabitacion = Tiposdehabitacion.find(params[:id])
      @tiposdehabitacion.destroy
  end
  
 
  def sort_column
    Tiposdehabitacion.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
