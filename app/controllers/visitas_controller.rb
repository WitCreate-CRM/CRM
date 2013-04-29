class VisitasController < ApplicationController
  # GET /visitas
  # GET /visitas.json
  def index
    @visitas = Visita.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @visitas }
    end
  end

  # GET /visitas/1
  # GET /visitas/1.json
  def show
    @visita = Visita.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @visita }
    end
  end

  # GET /visitas/new
  # GET /visitas/new.json
  def new
    @visita = Visita.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @visita }
    end
  end

  # GET /visitas/1/edit
  def edit
    @visita = Visita.find(params[:id])
  end

  # POST /visitas
  # POST /visitas.json
  def create
    @visita = Visita.new(params[:visita])

    respond_to do |format|
      if @visita.save
        format.html { redirect_to @visita, notice: 'Visita was successfully created.' }
        format.json { render json: @visita, status: :created, location: @visita }
      else
        format.html { render action: "new" }
        format.json { render json: @visita.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /visitas/1
  # PUT /visitas/1.json
  def update
    @visita = Visita.find(params[:id])

    respond_to do |format|
      if @visita.update_attributes(params[:visita])
        format.html { redirect_to @visita, notice: 'Visita was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @visita.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitas/1
  # DELETE /visitas/1.json
  def destroy
    @visita = Visita.find(params[:id])
    @visita.destroy

    respond_to do |format|
      format.html { redirect_to visitas_url }
      format.json { head :no_content }
    end
  end
end
