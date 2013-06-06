class CortesiasController < ApplicationController

  before_filter :require_login

  autocomplete :alimento, :descripcion, :full => true

  before_filter :find_huesped_cortesias

  helper_method :sort_column, :sort_direction

  def index
    if params[:limit] == nil or params[:limit] <= "0" then
          params[:limit] = 10
    end

    @cortesias = @huesped.cortesias.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format|
      format.html 
      format.json { render json: @cortesias }
    end
  end

  def show
      respond_to do |format|
      format.js 
      format.pdf do
          pdf = CortesiaPdf.new(@cortesia, view_context)
          send_data pdf.render, filename:
          "Cortesia_#{@cortesia.id}.pdf", type: "application/pdf"
        end
      end
  end

  def new
      @cortesia = Cortesia.new
  end

  def edit
  end

  def create
      @cortesia = @huesped.cortesias.build(params[:cortesia])
      render :action => :new unless @cortesia.save
  end

  def update
      render :action => :edit unless @cortesia.update_attributes(params[:cortesia])
  end

  def destroy
      @cortesia.destroy
  end
  
 private
 
  def sort_column
    Cortesia.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

  def find_huesped_cortesias
    @huesped = Huesped.find(params[:huesped_id])
    @cortesia = Cortesia.find(params[:id]) if params[:id]
  end

end
