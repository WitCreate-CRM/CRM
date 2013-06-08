class ContactosController < ApplicationController

  before_filter :require_login

  helper_method :sort_column, :sort_direction

  def index
    
    if params[:limit] == nil or params[:limit] <= "0" then
          params[:limit] = 10
    end

    @contactos = Contacto.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contactos }
    end
  end

  def show

    @contacto = Contacto.find(params[:id])
    respond_to do |format|
      format.js # show.html.erb
      
        format.pdf do
          pdf = ContactoPdf.new(@contacto, view_context)
          send_data pdf.render, filename:
         "Contacto_#{@contacto.id}.pdf",
          type: "application/pdf"
   end
       end
 end

  def new
      @contacto = Contacto.new
  end

  def edit
      @contacto = Contacto.find(params[:id])
  end

  def create
      @contacto  = Contacto.new(params[:contacto])
      render :action => :new unless @contacto.save
  end

  def update
      @contacto = Contacto.find(params[:id])
      render :action => :edit unless @contacto.update_attributes(params[:contacto])
  end

  def destroy
      @contacto  = Contacto.find(params[:id])
      @contacto.destroy
  end
  
  private
 
  def sort_column
    Contacto.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end