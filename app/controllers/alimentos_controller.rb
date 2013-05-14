class AlimentosController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index
    if params[:limit] == nil or params[:limit] <= "0" then
          params[:limit] = 10
    end
    
    @alimentos = Alimento.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format|
      format.html 
      format.json { render json: @alimentos }
    end
  end

  def show
      @alimento = Alimento.find(params[:id])
  end

  def new
      @alimento = Alimento.new
  end

  def edit
      @alimento = Alimento.find(params[:id])
  end

  def create
      @alimento = Alimento.new(params[:alimento])
      render :action => :new unless @alimento.save
  end

  def update
      @alimento = Alimento.find(params[:id])
      render :action => :edit unless @alimento.update_attributes(params[:alimento])
  end

  def destroy
      @alimento = Alimento.find(params[:id])
      @alimento.destroy
  end

 private
 
  def sort_column
    Alimento.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
  
end