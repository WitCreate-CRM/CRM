class SugerenciasyquejasController < ApplicationController
 
  before_filter :require_login
 
  autocomplete :huesped, :primer_nombre, :full => true

  helper_method :sort_column, :sort_direction

def index
  if params[:limit] == nil or params[:limit] <= "0" then
        params[:limit] = 10
  end

    @sugerenciasyquejas = Sugerenciasyqueja.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format|
      format.html
      format.json { render json: @sugerenciasyquejas }
    end
  end

  def show
      @sugerenciasyqueja = Sugerenciasyqueja.find(params[:id])

      respond_to do |format|
      format.js 
      format.pdf do
          pdf = SugerenciasyquejaPdf.new(@sugerenciasyqueja, view_context)
          send_data pdf.render, filename:
          "Sugerenciasyqueja_#{@sugerenciasyqueja.id}.pdf", type: "application/pdf"
        end
      end
  end

  def new
      @sugerenciasyqueja = Sugerenciasyqueja.new
  end

  def edit
      @sugerenciasyqueja = Sugerenciasyqueja.find(params[:id])
  end

  def create
      @sugerenciasyqueja = Sugerenciasyqueja.new(params[:sugerenciasyqueja])
      render :action => :new unless @sugerenciasyqueja.save
  end

  def update
      @sugerenciasyqueja = Sugerenciasyqueja.find(params[:id])
      render :action => :edit unless @sugerenciasyqueja.update_attributes(params[:sugerenciasyqueja])
  end

  def destroy
      @sugerenciasyqueja = Sugerenciasyqueja.find(params[:id])
      @sugerenciasyqueja.destroy
  end
  
 private
 
  def sort_column
    Sugerenciasyqueja.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
