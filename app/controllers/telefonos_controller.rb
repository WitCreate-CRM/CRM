class TelefonosController < ApplicationController

  before_filter :find_huesped_telefonos

<<<<<<< HEAD
   helper_method :sort_column, :sort_direction

   before_filter :find_empleado_telefonos
=======
  helper_method :sort_column, :sort_direction
>>>>>>> 2d302407786e22f7976665e2b1d8fac36cfe483b
   
  def index

    if params[:limit] == nil or params[:limit] <= "0" then
          params[:limit] = 10
    end

<<<<<<< HEAD
    @telefonos = @empleado.telefonos.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
=======
    @telefonos = @huesped.telefonos.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
>>>>>>> 2d302407786e22f7976665e2b1d8fac36cfe483b
    respond_to do |format|
      format.html 
      format.json { render json: @telefonos }
    end
  end

  def show
<<<<<<< HEAD
      
=======
>>>>>>> 2d302407786e22f7976665e2b1d8fac36cfe483b
    respond_to do |format|
    format.js 
    format.pdf do
      pdf = TelefonoPdf.new(@telefono, view_context)
      send_data pdf.render, filename:
      "Telefono_#{@telefono.id}.pdf", type: "application/pdf"
      end
    end
  end

  def new
      @telefono = @empleado.telefonos.build(params[:telefono])
  end

  def edit
<<<<<<< HEAD
      
  end

  def create
      @telefono = @empleado.telefonos.build(params[:telefono])
=======
  end

  def create
      @telefono  = @huesped.telefonos.build(params[:telefono])
>>>>>>> 2d302407786e22f7976665e2b1d8fac36cfe483b
      render :action => :new unless @telefono.save
 end

  def update
<<<<<<< HEAD
      
=======
>>>>>>> 2d302407786e22f7976665e2b1d8fac36cfe483b
      render :action => :edit unless @telefono.update_attributes(params[:telefono])
  end

  def destroy
<<<<<<< HEAD
      @telefono .destroy
=======
      @telefono.destroy
>>>>>>> 2d302407786e22f7976665e2b1d8fac36cfe483b
  end

  private 

<<<<<<< HEAD

    def find_empleado_telefonos

     @empleado= Empleado.find(params[:empleado_id]) 
     @telefono = Telefono.find(params[:id]) if params[:id] 

    end
   
    def sort_column
      Telefono.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
    
=======
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
  
  def find_huesped_telefonos
    @huesped = Huesped.find(params[:huesped_id])
    @telefono = Telefono.find(params[:id]) if params[:id]
  end

>>>>>>> 2d302407786e22f7976665e2b1d8fac36cfe483b
end