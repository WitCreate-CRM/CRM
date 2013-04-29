class AlimentosController < ApplicationController
  # GET /alimentos
  # GET /alimentos.json
  def index
    @alimentos = Alimento.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @alimentos }
    end
  end

  # GET /alimentos/1
  # GET /alimentos/1.json
  def show
    @alimento = Alimento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @alimento }
    end
  end

  # GET /alimentos/new
  # GET /alimentos/new.json
  def new
    @alimento = Alimento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @alimento }
    end
  end

  # GET /alimentos/1/edit
  def edit
    @alimento = Alimento.find(params[:id])
  end

  # POST /alimentos
  # POST /alimentos.json
  def create
    @alimento = Alimento.new(params[:alimento])

    respond_to do |format|
      if @alimento.save
        format.html { redirect_to @alimento, notice: 'Alimento was successfully created.' }
        format.json { render json: @alimento, status: :created, location: @alimento }
      else
        format.html { render action: "new" }
        format.json { render json: @alimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /alimentos/1
  # PUT /alimentos/1.json
  def update
    @alimento = Alimento.find(params[:id])

    respond_to do |format|
      if @alimento.update_attributes(params[:alimento])
        format.html { redirect_to @alimento, notice: 'Alimento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @alimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alimentos/1
  # DELETE /alimentos/1.json
  def destroy
    @alimento = Alimento.find(params[:id])
    @alimento.destroy

    respond_to do |format|
      format.html { redirect_to alimentos_url }
      format.json { head :no_content }
    end
  end
end
