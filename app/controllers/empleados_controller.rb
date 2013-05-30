class EmpleadosController < ApplicationController
  
    helper_method :sort_column, :sort_direction

    before_filter :find_empleado, :except => [ :index, :create, :new ]

  def index

    if params[:limit] == nil or params[:limit] <= "0" then
          params[:limit] = 10
    end

    @empleados = Empleado.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @empleados}
    end

 end

  def show
    
       respond_to do |format|
       format.js # show.html.erb
      
        format.pdf do
          pdf = EmpleadoPdf.new(@empleado, view_context)
          send_data pdf.render, filename:
         "Empleado_#{@empleado.id}.pdf",
          type: "application/pdf"
     end
    end
  end

  def new
      @empleado = Empleado.new
  end

  def edit
      
  end


  def create
      @empleado  = Empleado.new(params[:empleado])
      render :action => :new unless @empleado.save
      @empleados = Empleado.all
      #render :action => :new unless @instructor.save
  end

  def update
      
      render :action => :edit unless @empleado.update_attributes(params[:empleado])
  end

  def destroy
      @empleado .destroy
      @empleados = Empleado.all
  end

  private

  def find_empleado
      @empleado = Empleado.find(params[:id]) if params[:id]
  end
 
  def sort_column
    Empleado.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end