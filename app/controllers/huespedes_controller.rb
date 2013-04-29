class HuespedesController < ApplicationController
  # GET /huespedes
  # GET /huespedes.json
  def index
    @huespedes = Huesped.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @huespedes }
    end
  end

  # GET /huespedes/1
  # GET /huespedes/1.json
  def show
    @huesped = Huesped.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @huesped }
    end
  end

  # GET /huespedes/new
  # GET /huespedes/new.json
  def new
    @huesped = Huesped.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @huesped }
    end
  end

  # GET /huespedes/1/edit
  def edit
    @huesped = Huesped.find(params[:id])
  end

  # POST /huespedes
  # POST /huespedes.json
  def create
    @huesped = Huesped.new(params[:huesped])

    respond_to do |format|
      if @huesped.save
        format.html { redirect_to @huesped, notice: 'Huesped was successfully created.' }
        format.json { render json: @huesped, status: :created, location: @huesped }
      else
        format.html { render action: "new" }
        format.json { render json: @huesped.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /huespedes/1
  # PUT /huespedes/1.json
  def update
    @huesped = Huesped.find(params[:id])

    respond_to do |format|
      if @huesped.update_attributes(params[:huesped])
        format.html { redirect_to @huesped, notice: 'Huesped was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @huesped.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /huespedes/1
  # DELETE /huespedes/1.json
  def destroy
    @huesped = Huesped.find(params[:id])
    @huesped.destroy

    respond_to do |format|
      format.html { redirect_to huespedes_url }
      format.json { head :no_content }
    end
  end
end
