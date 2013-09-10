class ZonasController < ApplicationController

  before_filter :require_login
  
  helper_method :sort_column, :sort_direction

   def index

    if params[:limit] == nil or params[:limit] <= "0" then
          params[:limit] = 10
    end

    @zonas = Zona.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format|
      format.html
      format.json { render json: @zonas }
    end
  end

  def show
    @zona = Zona.find(params[:id])
    
    respond_to do |format|
      format.js
      
        format.pdf do
          pdf = ZonaPdf.new(@zona, view_context)
          send_data pdf.render, filename:
         "Zona_#{@zona.id}.pdf",
          type: "application/pdf"
     end
    end
  end

  def new
      @zona = Zona.new
  end

  def edit
      @zona = Zona.find(params[:id])
  end

  def create
      @zona = Zona.new(params[:zona])
      render :action => :new unless @zona.save
  end

  def update
      @zona = Zona.find(params[:id])
      render :action => :edit unless @zona.update_attributes(params[:zona])
  end

  def destroy
      @zona = Zona.find(params[:id])
      @zona.destroy
  end

  private
 
  def sort_column
    Zona.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
  
end
