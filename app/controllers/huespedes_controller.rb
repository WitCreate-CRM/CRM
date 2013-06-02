class HuespedesController < ApplicationController
  
  before_filter :find_huesped, :except => [ :index, :create, :new]

  helper_method :sort_column, :sort_direction

  def index
    if params[:limit] == nil or params[:limit] <= "0" then
          params[:limit] = 10
    end

    @huespedes = Huesped.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format|
      format.html 
      format.json { render json: @huespedes }
    end
  end

  def show
      respond_to do |format|
      format.js 
      format.pdf do
          pdf = HuespedPdf.new(@huesped, view_context)
          send_data pdf.render, filename:
          "Huesped_#{@huesped.id}.pdf", type: "application/pdf"
        end
      end
  end

  def new
      @huesped = Huesped.new
  end

  def edit
  end

  def create
      @huesped = Huesped.new(params[:huesped])
      render :action => :new unless @huesped.save
      @huespedes = Huesped.all
  end

  def update
      render :action => :edit unless @huesped.update_attributes(params[:huesped])
  end

  def destroy
      @huesped.destroy
  end
  
 private
 
  def sort_column
    Huesped.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

  def find_huesped
    @huesped = Huesped.find(params[:id]) if params[:id]
  end
  
end