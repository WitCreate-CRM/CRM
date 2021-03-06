class TelefonosController < ApplicationController

  before_filter :require_login

  before_filter :find_huesped_telefonos

  helper_method :sort_column, :sort_direction
   
  def index

    if params[:limit] == nil or params[:limit] <= "0" then
          params[:limit] = 10
    end

    @telefonos = @huesped.telefonos.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format|
      format.html 
      format.json { render json: @telefonos }
    end
  end

  def show
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
      @telefono = Telefono.new
  end

  def edit
  end

  def create
      @telefono  = @huesped.telefonos.build(params[:telefono])
      render :action => :new unless @telefono.save
  end

  def update
      render :action => :edit unless @telefono.update_attributes(params[:telefono])
  end

  def destroy
      @telefono.destroy
  end

  private
 
  def sort_column
    Telefono.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
  
  def find_huesped_telefonos
    @huesped = Huesped.find(params[:huesped_id])
    @telefono = Telefono.find(params[:id]) if params[:id]
  end

end