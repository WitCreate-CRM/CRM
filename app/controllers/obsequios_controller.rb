class ObsequiosController < ApplicationController

  def index
    @obsequios= Obsequio.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @obsequios}
    end
  end

  def show
      @obsequio = Obsequio.find(params[:id])
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
  
end