class ObsequiosController < ApplicationController
  # GET /obsequios
  # GET /obsequios.json
  def index
    @obsequios = Obsequio.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @obsequios }
    end
  end

  # GET /obsequios/1
  # GET /obsequios/1.json
  def show
    @obsequio = Obsequio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @obsequio }
    end
  end

  # GET /obsequios/new
  # GET /obsequios/new.json
  def new
    @obsequio = Obsequio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @obsequio }
    end
  end

  # GET /obsequios/1/edit
  def edit
    @obsequio = Obsequio.find(params[:id])
  end

  # POST /obsequios
  # POST /obsequios.json
  def create
    @obsequio = Obsequio.new(params[:obsequio])

    respond_to do |format|
      if @obsequio.save
        format.html { redirect_to @obsequio, notice: 'Obsequio was successfully created.' }
        format.json { render json: @obsequio, status: :created, location: @obsequio }
      else
        format.html { render action: "new" }
        format.json { render json: @obsequio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /obsequios/1
  # PUT /obsequios/1.json
  def update
    @obsequio = Obsequio.find(params[:id])

    respond_to do |format|
      if @obsequio.update_attributes(params[:obsequio])
        format.html { redirect_to @obsequio, notice: 'Obsequio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @obsequio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /obsequios/1
  # DELETE /obsequios/1.json
  def destroy
    @obsequio = Obsequio.find(params[:id])
    @obsequio.destroy

    respond_to do |format|
      format.html { redirect_to obsequios_url }
      format.json { head :no_content }
    end
  end
end
