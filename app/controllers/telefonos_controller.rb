class TelefonosController < ApplicationController
  # GET /telefonos
  # GET /telefonos.json
  def index
    @telefonos = Telefono.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @telefonos }
    end
  end

  # GET /telefonos/1
  # GET /telefonos/1.json
  def show
    @telefono = Telefono.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @telefono }
    end
  end

  # GET /telefonos/new
  # GET /telefonos/new.json
  def new
    @telefono = Telefono.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @telefono }
    end
  end

  # GET /telefonos/1/edit
  def edit
    @telefono = Telefono.find(params[:id])
  end

  # POST /telefonos
  # POST /telefonos.json
  def create
    @telefono = Telefono.new(params[:telefono])

    respond_to do |format|
      if @telefono.save
        format.html { redirect_to @telefono, notice: 'Telefono was successfully created.' }
        format.json { render json: @telefono, status: :created, location: @telefono }
      else
        format.html { render action: "new" }
        format.json { render json: @telefono.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /telefonos/1
  # PUT /telefonos/1.json
  def update
    @telefono = Telefono.find(params[:id])

    respond_to do |format|
      if @telefono.update_attributes(params[:telefono])
        format.html { redirect_to @telefono, notice: 'Telefono was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @telefono.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /telefonos/1
  # DELETE /telefonos/1.json
  def destroy
    @telefono = Telefono.find(params[:id])
    @telefono.destroy

    respond_to do |format|
      format.html { redirect_to telefonos_url }
      format.json { head :no_content }
    end
  end
end
