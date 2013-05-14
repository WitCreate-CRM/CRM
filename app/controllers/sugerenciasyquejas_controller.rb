class SugerenciasyquejasController < ApplicationController
  
def index
    @sugerenciasyquejas = Sugerenciasyqueja.all
    respond_to do |format|
      format.html
      format.json { render json: @sugerenciasyquejas }
    end
  end

  def show
      @sugerenciasyqueja = Sugerenciasyqueja.find(params[:id])
  end

  def new
      @sugerenciasyqueja = Sugerenciasyqueja.new
  end

  def edit
      @sugerenciasyqueja = Sugerenciasyqueja.find(params[:id])
  end

  def create
      @sugerenciasyqueja = Sugerenciasyqueja.new(params[:sugerenciasyqueja])
      render :action => :new unless @sugerenciasyqueja.save
  end

  def update
      @sugerenciasyqueja = Sugerenciasyqueja.find(params[:id])
      render :action => :edit unless @sugerenciasyqueja.update_attributes(params[:sugerenciasyqueja])
  end

  def destroy
      @sugerenciasyqueja = Sugerenciasyqueja.find(params[:id])
      @sugerenciasyqueja.destroy
  end
  
end
