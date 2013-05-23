class PreferenciasController < ApplicationController

  helper_method :sort_column, :sort_direction  

  def index
    if params[:limit] == nil or params[:limit] <= "0" then
          params[:limit] = 10
    end

    @preferencias = Preferencia.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format|
      format.html 
      format.json { render json: @preferencias }
    end
  end

  def show
      @preferencia = Preferencia.find(params[:id])

      respond_to do |format|
      format.js 
      format.pdf do
          pdf = PreferenciaPdf.new(@preferencia, view_context)
          send_data pdf.render, filename:
          "Preferencia_#{@preferencia.id}.pdf", type: "application/pdf"
        end
      end
  end

  def new
      @preferencia = Preferencia.new
  end

  def edit
      @preferencia = Preferencia.find(params[:id])
  end

  def create
      @preferencia = Preferencia.new(params[:preferencia])
      render :action => :new unless @preferencia.save
  end

  def update
      @preferencia = Preferencia.find(params[:id])
      render :action => :edit unless @preferencia.update_attributes(params[:preferencia])
  end

  def destroy
      @preferencia = Preferencia.find(params[:id])
      @preferencia.destroy
  end
  
 private
 
  def sort_column
    Preferencia.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end