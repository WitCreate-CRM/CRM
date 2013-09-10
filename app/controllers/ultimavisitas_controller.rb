class UltimavisitasController < ApplicationController

  before_filter :require_login
  
  helper_method :sort_column, :sort_direction

  before_filter :find_visita_ultimavisitas


  def index

    if params[:limit] == nil or params[:limit] <= "0" then
          params[:limit] = 10
    end

    @ultimavisitas =@visita.ultimavisitas.order(sort_column + ' ' + sort_direction).search(params[:contact], params[:fecha]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format|
      format.html
      format.json { render json: @ultimavisitas }
    end
  end

  def show
      
    respond_to do |format|
      format.js
      
        format.pdf do
          pdf = UltimavisitaPdf.new(@ultimavisita, view_context)
          send_data pdf.render, filename:
         "Ultimavisita_#{@ultimavisita.id}.pdf",
          type: "application/pdf"
     end
    end
  end

  def new
      @ultimavisita = Ultimavisita.new
  end

  def edit
      
  end

  def create
      @ultimavisita = @visita.ultimavisitas.build(params[:ultimavisita])
      render :action => :new unless @ultimavisita.save
  end

  def update
      
      render :action => :edit unless @ultimavisita.update_attributes(params[:ultimavisita])
  end

  def destroy
      
      @ultimavisita.destroy
  end
  

  private

    def find_visita_ultimavisitas
    @visita = Visita.find(params[:visita_id])
    @ultimavisita = Ultimavisita.find(params[:id]) if params[:id]
  end

 
  def sort_column
    Ultimavisita.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
