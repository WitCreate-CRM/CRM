class CargosController < ApplicationController
  
  before_filter :require_login
  
  helper_method :sort_column, :sort_direction

  def index

    if params[:limit] == nil or params[:limit] <= "0" then
          params[:limit] = 10
    end

    @cargos = Cargo.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format|
      format.html
      format.json { render json: @cargos }
    end
  end


  def show
    @cargo = Cargo.find(params[:id])
    
    respond_to do |format|
      format.js
      
        format.pdf do
          pdf = CargoPdf.new(@cargo, view_context)
          send_data pdf.render, filename:
         "Cargo_#{@cargo.id}.pdf",
          type: "application/pdf"
     end
    end
  end

  def new
      @cargo = Cargo.new
  end

  def edit
      @cargo  = Cargo.find(params[:id])
  end

  def create
      @cargo   = Cargo.new(params[:cargo ])
      render :action => :new unless @cargo .save
  end

  def update
      @cargo   = Cargo.find(params[:id])
      render :action => :edit unless @cargo.update_attributes(params[:cargo ])
  end

  def destroy
      @cargo  = Cargo.find(params[:id])
      @cargo.destroy
  end

  private
 
  def sort_column
    Cargo.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end