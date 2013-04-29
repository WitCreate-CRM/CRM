class PreferenciasController < ApplicationController
  # GET /preferencias
  # GET /preferencias.json
  def index
    @preferencias = Preferencia.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @preferencias }
    end
  end

  # GET /preferencias/1
  # GET /preferencias/1.json
  def show
    @preferencia = Preferencia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @preferencia }
    end
  end

  # GET /preferencias/new
  # GET /preferencias/new.json
  def new
    @preferencia = Preferencia.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @preferencia }
    end
  end

  # GET /preferencias/1/edit
  def edit
    @preferencia = Preferencia.find(params[:id])
  end

  # POST /preferencias
  # POST /preferencias.json
  def create
    @preferencia = Preferencia.new(params[:preferencia])

    respond_to do |format|
      if @preferencia.save
        format.html { redirect_to @preferencia, notice: 'Preferencia was successfully created.' }
        format.json { render json: @preferencia, status: :created, location: @preferencia }
      else
        format.html { render action: "new" }
        format.json { render json: @preferencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /preferencias/1
  # PUT /preferencias/1.json
  def update
    @preferencia = Preferencia.find(params[:id])

    respond_to do |format|
      if @preferencia.update_attributes(params[:preferencia])
        format.html { redirect_to @preferencia, notice: 'Preferencia was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @preferencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preferencias/1
  # DELETE /preferencias/1.json
  def destroy
    @preferencia = Preferencia.find(params[:id])
    @preferencia.destroy

    respond_to do |format|
      format.html { redirect_to preferencias_url }
      format.json { head :no_content }
    end
  end
end
