class EmpresasController < ApplicationController

  def index
    if params[:limit] == nil or params[:limit] <= "0" then
          params[:limit] = 10
    end

    @empresas = Empresa.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @empresas}
    end
  end

  def show
      @empresa = Empresa.find(params[:id])
  end

  def new
      @empresa = Empresa.new
  end

  def edit
      @empresa  = Empresa.find(params[:id])
  end

  def create
      @empresa  = Empresa.new(params[:empresa])
      render :action => :new unless @empresa.save
  end

  def update
      @empresa  = Empresa.find(params[:id])
      render :action => :edit unless @empresa.update_attributes(params[:empresa])
  end

  def destroy
      @empresa  = Empresa.find(params[:id])
      @empresa .destroy
  end
  private
 
  def sort_column
    Empresa.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end