class SugerenciasyquejasController < ApplicationController
  # GET /sugerenciasyquejas
  # GET /sugerenciasyquejas.json
  def index
    @sugerenciasyquejas = Sugerenciasyqueja.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sugerenciasyquejas }
    end
  end

  # GET /sugerenciasyquejas/1
  # GET /sugerenciasyquejas/1.json
  def show
    @sugerenciasyqueja = Sugerenciasyqueja.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sugerenciasyqueja }
    end
  end

  # GET /sugerenciasyquejas/new
  # GET /sugerenciasyquejas/new.json
  def new
    @sugerenciasyqueja = Sugerenciasyqueja.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sugerenciasyqueja }
    end
  end

  # GET /sugerenciasyquejas/1/edit
  def edit
    @sugerenciasyqueja = Sugerenciasyqueja.find(params[:id])
  end

  # POST /sugerenciasyquejas
  # POST /sugerenciasyquejas.json
  def create
    @sugerenciasyqueja = Sugerenciasyqueja.new(params[:sugerenciasyqueja])

    respond_to do |format|
      if @sugerenciasyqueja.save
        format.html { redirect_to @sugerenciasyqueja, notice: 'Sugerenciasyqueja was successfully created.' }
        format.json { render json: @sugerenciasyqueja, status: :created, location: @sugerenciasyqueja }
      else
        format.html { render action: "new" }
        format.json { render json: @sugerenciasyqueja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sugerenciasyquejas/1
  # PUT /sugerenciasyquejas/1.json
  def update
    @sugerenciasyqueja = Sugerenciasyqueja.find(params[:id])

    respond_to do |format|
      if @sugerenciasyqueja.update_attributes(params[:sugerenciasyqueja])
        format.html { redirect_to @sugerenciasyqueja, notice: 'Sugerenciasyqueja was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sugerenciasyqueja.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sugerenciasyquejas/1
  # DELETE /sugerenciasyquejas/1.json
  def destroy
    @sugerenciasyqueja = Sugerenciasyqueja.find(params[:id])
    @sugerenciasyqueja.destroy

    respond_to do |format|
      format.html { redirect_to sugerenciasyquejas_url }
      format.json { head :no_content }
    end
  end
end
