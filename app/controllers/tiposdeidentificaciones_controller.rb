class TiposdeidentificacionesController < ApplicationController
  # GET /tiposdeidentificaciones
  # GET /tiposdeidentificaciones.json
  def index
    @tiposdeidentificaciones = Tiposdeidentificacion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tiposdeidentificaciones }
    end
  end

  # GET /tiposdeidentificaciones/1
  # GET /tiposdeidentificaciones/1.json
  def show
    @tiposdeidentificacion = Tiposdeidentificacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tiposdeidentificacion }
    end
  end

  # GET /tiposdeidentificaciones/new
  # GET /tiposdeidentificaciones/new.json
  def new
    @tiposdeidentificacion = Tiposdeidentificacion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tiposdeidentificacion }
    end
  end

  # GET /tiposdeidentificaciones/1/edit
  def edit
    @tiposdeidentificacion = Tiposdeidentificacion.find(params[:id])
  end

  # POST /tiposdeidentificaciones
  # POST /tiposdeidentificaciones.json
  def create
    @tiposdeidentificacion = Tiposdeidentificacion.new(params[:tiposdeidentificacion])

    respond_to do |format|
      if @tiposdeidentificacion.save
        format.html { redirect_to @tiposdeidentificacion, notice: 'Tiposdeidentificacion was successfully created.' }
        format.json { render json: @tiposdeidentificacion, status: :created, location: @tiposdeidentificacion }
      else
        format.html { render action: "new" }
        format.json { render json: @tiposdeidentificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tiposdeidentificaciones/1
  # PUT /tiposdeidentificaciones/1.json
  def update
    @tiposdeidentificacion = Tiposdeidentificacion.find(params[:id])

    respond_to do |format|
      if @tiposdeidentificacion.update_attributes(params[:tiposdeidentificacion])
        format.html { redirect_to @tiposdeidentificacion, notice: 'Tiposdeidentificacion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tiposdeidentificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tiposdeidentificaciones/1
  # DELETE /tiposdeidentificaciones/1.json
  def destroy
    @tiposdeidentificacion = Tiposdeidentificacion.find(params[:id])
    @tiposdeidentificacion.destroy

    respond_to do |format|
      format.html { redirect_to tiposdeidentificaciones_url }
      format.json { head :no_content }
    end
  end
end
