class ObsequiosController < ApplicationController

    helper_method :sort_column, :sort_direction

  def index
    
    if params[:limit] == nil or params[:limit] <= "0" then
          params[:limit] = 10
    end

    @obsequios = Obsequio.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @obsequios}
    end
  end

  def show
       @obsequio = Obsequio.find(params[:id])
       respond_to do |format|
       format.js # show.html.erb
      
        format.pdf do
          pdf = ObsequioPdf.new(@obsequio, view_context)
          send_data pdf.render, filename:
         "Obsequio_#{@obsequio.id}.pdf",
          type: "application/pdf"
     end
    end
  end

  def new
      @obsequio = Obsequio.new
  end

  def edit
      @obsequio  = Obsequio.find(params[:id])
  end

  def create
      @obsequio  = Obsequio.new(params[:obsequio])
      render :action => :new unless @obsequio.save
  end

  def update
      @obsequio  = Obsequio.find(params[:id])
      render :action => :edit unless @obsequio.update_attributes(params[:obsequio])
  end

  def destroy
      @obsequio  = Obsequio.find(params[:id])
      @obsequio .destroy
  end

  private
 
  def sort_column
    Obsequio.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
  
  
end