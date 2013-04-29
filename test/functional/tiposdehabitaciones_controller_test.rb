require 'test_helper'

class TiposdehabitacionesControllerTest < ActionController::TestCase
  setup do
    @tiposdehabitacion = tiposdehabitaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tiposdehabitaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tiposdehabitacion" do
    assert_difference('Tiposdehabitacion.count') do
      post :create, tiposdehabitacion: { descripcion: @tiposdehabitacion.descripcion, habitacion_tina: @tiposdehabitacion.habitacion_tina, piso: @tiposdehabitacion.piso }
    end

    assert_redirected_to tiposdehabitacion_path(assigns(:tiposdehabitacion))
  end

  test "should show tiposdehabitacion" do
    get :show, id: @tiposdehabitacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tiposdehabitacion
    assert_response :success
  end

  test "should update tiposdehabitacion" do
    put :update, id: @tiposdehabitacion, tiposdehabitacion: { descripcion: @tiposdehabitacion.descripcion, habitacion_tina: @tiposdehabitacion.habitacion_tina, piso: @tiposdehabitacion.piso }
    assert_redirected_to tiposdehabitacion_path(assigns(:tiposdehabitacion))
  end

  test "should destroy tiposdehabitacion" do
    assert_difference('Tiposdehabitacion.count', -1) do
      delete :destroy, id: @tiposdehabitacion
    end

    assert_redirected_to tiposdehabitaciones_path
  end
end
