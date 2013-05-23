class CortesiasController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index
    if params[:limit] == nil or params[:limit] <= "0" then
          params[:limit] = 10
    end

    @cortesias = Cortesia.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format|
      format.html 
      format.json { render json: @cortesias }
    end
  end

  def show
      @cortesia = Cortesia.find(params[:id])

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
      @cortesia = Cortesia.find(params[:id])
  end

  def create
      @cortesia = Cortesia.new(params[:cortesia])
      render :action => :new unless @cortesia.save
  end

  def update
      @cortesia = Cortesia.find(params[:id])
      render :action => :edit unless @cortesia.update_attributes(params[:cortesia])
  end

  def destroy
      @cortesia = Cortesia.find(params[:id])
      @cortesia.destroy
  end
  
 private
 
  def sort_column
    Cortesia.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
