class EmpresasController < ApplicationController

   before_filter :require_login

   helper_method :sort_column, :sort_direction

   before_filter :find_empleado_empresas


  def index

    if params[:limit] == nil or params[:limit] <= "0" then
          params[:limit] = 10
    end

    @empresas = @empleado.empresas.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @empresas}
    end
  end

  def show
      
    respond_to do |format|
      format.js # show.html.erb
      
        format.pdf do
          pdf = EmpresaPdf.new(@empresa, view_context)
          send_data pdf.render, filename:
         "Empresa_#{@empresa.id}.pdf",
          type: "application/pdf"
     end
    end
  end

  def new
      @empresa = Empresa.new
  end

  def edit
  end

  def create
      @empresa = @empleado.empresas.build(params[:empresa])
      render :action => :new unless @empresa.save
  end

  def update
      render :action => :edit unless @empresa.update_attributes(params[:empresa])
  end

  def destroy
      @empresa.destroy
  end
  
  private
 
  def sort_column
    Empresa.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
  
  def find_empleado_empresas
    @empleado = Empleado.find(params[:empleado_id])
    @empresa = Empresa.find(params[:id]) if params[:id]
  end

end