class VisitasController < ApplicationController

  def index
    if params[:limit] == nil or params[:limit] <= "0" then
          params[:limit] = 10
    end

    @visitas = Visita.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format| 
    format.html # index.html.erb 
    format.xml { render :xml => @visitas } 
   end 
     end

  def show
      @visita = Visita.find(params[:id])
  end

  def new
      @visita = Visita.new
  end

  def edit
      @visita  = Visita.find(params[:id])
  end

  def create
      @visita  = Visita.new(params[:visita])
      render :action => :new unless @visita.save
  end

  def update
      @visita  = Visita.find(params[:id])
      render :action => :edit unless @visita.update_attributes(params[:visita])
  end

  def destroy
      @visita  = Visita.find(params[:id])
      @visita .destroy
  end

  private
 
  def sort_column
    Alimento.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
  
end