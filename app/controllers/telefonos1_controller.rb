class Telefonos1Controller < ApplicationController

  before_filter :require_login

  before_filter :find_empleado_telefonos1

  helper_method :sort_column, :sort_direction
   
  def index

    if params[:limit] == nil or params[:limit] <= "0" then
          params[:limit] = 10
    end

    @telefonos1 = @empleado.telefonos1.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format|
      format.html 
      format.json { render json: @telefonos1 }
    end
  end

  def show
    respond_to do |format|
    format.js 
    format.pdf do
      pdf = Telefono1Pdf.new(@telefono1, view_context)
      send_data pdf.render, filename:
      "Telefono1_#{@telefono1.id}.pdf", type: "application/pdf"
      end
    end
  end

  def new
      @telefono1 = Telefono1.new
  end

  def edit
  end

  def create
      @telefono1  = @empleado.telefonos1.build(params[:telefono1])
      render :action => :new unless @telefono1.save
  end

  def update
      render :action => :edit unless @telefono1.update_attributes(params[:telefono1])
  end

  def destroy
      @telefono1.destroy
  end

  private
 
  def sort_column
    Telefono1.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
  
  def find_empleado_telefonos1
    @empleado = Empleado.find(params[:empleado_id])
    @telefono1 = Telefono1.find(params[:id]) if params[:id]
  end

end