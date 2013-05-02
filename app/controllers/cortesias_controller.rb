class CortesiasController < ApplicationController

  def index
    @cortesias = Cortesia.all

    respond_to do |format|
      format.html 
      format.json { render json: @cortesias }
    end
  end


  def show
    @cortesia = Cortesia.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @cortesia }
    end
  end


  def new
    @cortesia = Cortesia.new

    respond_to do |format|
      format.html 
      format.json { render json: @cortesia }
    end
  end


  def edit
    @cortesia = Cortesia.find(params[:id])
  end


  def create
    @cortesia = Cortesia.new(params[:cortesia])

    respond_to do |format|
      if @cortesia.save
        format.html { redirect_to @cortesia, notice: 'Cortesia was successfully created.' }
        format.json { render json: @cortesia, status: :created, location: @cortesia }
      else
        format.html { render action: "new" }
        format.json { render json: @cortesia.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @cortesia = Cortesia.find(params[:id])

    respond_to do |format|
      if @cortesia.update_attributes(params[:cortesia])
        format.html { redirect_to @cortesia, notice: 'Cortesia was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cortesia.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @cortesia = Cortesia.find(params[:id])
    @cortesia.destroy

    respond_to do |format|
      format.html { redirect_to cortesias_url }
      format.json { head :no_content }
    end
  end
end
