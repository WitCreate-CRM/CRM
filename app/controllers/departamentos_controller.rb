class DepartamentosController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index

    if params[:limit] == nil or params[:limit] <= "0" then
          params[:limit] = 10
    end

    @departamentos = Departamento.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @departamentos }
    end
  end

  def show
      @departamento = Departamento.find(params[:id])
    respond_to do |format|
      format.js # show.html.erb
      
        format.pdf do
          pdf = DepartamentoPdf.new(@departamento, view_context)
          send_data pdf.render, filename:
         "Departamento_#{@departamento.id}.pdf",
          type: "application/pdf"
     end
    end
  end

  def new
      @departamento = Departamento.new
  end

  def edit
      @departamento = Departamento.find(params[:id])
  end

  def create
      @departamento  = Departamento.new(params[:departamento])
      render :action => :new unless @departamento.save
  end

  def update
      @visita  = Departamento.find(params[:id])
      render :action => :edit unless @departamento.update_attributes(params[:departamento])
  end

  def destroy
      @departamento  = Departamento.find(params[:id])
      @departamento .destroy
  end
  private
 
  def sort_column
    Departamento.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
  
end