class UsersController < ApplicationController
  def index
    @empleados = Empleado.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Usuario Creado !"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
