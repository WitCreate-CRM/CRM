class TiposdehabitacionesController < ApplicationController
  # GET /tiposdehabitaciones
  # GET /tiposdehabitaciones.json
  def index
    @tiposdehabitaciones = Tiposdehabitacion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tiposdehabitaciones }
    end
  end

  # GET /tiposdehabitaciones/1
  # GET /tiposdehabitaciones/1.json
  def show
    @tiposdehabitacion = Tiposdehabitacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tiposdehabitacion }
    end
  end

  # GET /tiposdehabitaciones/new
  # GET /tiposdehabitaciones/new.json
  def new
    @tiposdehabitacion = Tiposdehabitacion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tiposdehabitacion }
    end
  end

  # GET /tiposdehabitaciones/1/edit
  def edit
    @tiposdehabitacion = Tiposdehabitacion.find(params[:id])
  end

  # POST /tiposdehabitaciones
  # POST /tiposdehabitaciones.json
  def create
    @tiposdehabitacion = Tiposdehabitacion.new(params[:tiposdehabitacion])

    respond_to do |format|
      if @tiposdehabitacion.save
        format.html { redirect_to @tiposdehabitacion, notice: 'Tiposdehabitacion was successfully created.' }
        format.json { render json: @tiposdehabitacion, status: :created, location: @tiposdehabitacion }
      else
        format.html { render action: "new" }
        format.json { render json: @tiposdehabitacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tiposdehabitaciones/1
  # PUT /tiposdehabitaciones/1.json
  def update
    @tiposdehabitacion = Tiposdehabitacion.find(params[:id])

    respond_to do |format|
      if @tiposdehabitacion.update_attributes(params[:tiposdehabitacion])
        format.html { redirect_to @tiposdehabitacion, notice: 'Tiposdehabitacion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tiposdehabitacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tiposdehabitaciones/1
  # DELETE /tiposdehabitaciones/1.json
  def destroy
    @tiposdehabitacion = Tiposdehabitacion.find(params[:id])
    @tiposdehabitacion.destroy

    respond_to do |format|
      format.html { redirect_to tiposdehabitaciones_url }
      format.json { head :no_content }
    end
  end
end
