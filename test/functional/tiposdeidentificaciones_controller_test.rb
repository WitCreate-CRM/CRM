require 'test_helper'

class TiposdeidentificacionesControllerTest < ActionController::TestCase
  setup do
    @tiposdeidentificacion = tiposdeidentificaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tiposdeidentificaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tiposdeidentificacion" do
    assert_difference('Tiposdeidentificacion.count') do
      post :create, tiposdeidentificacion: { descripcion: @tiposdeidentificacion.descripcion, sigla: @tiposdeidentificacion.sigla }
    end

    assert_redirected_to tiposdeidentificacion_path(assigns(:tiposdeidentificacion))
  end

  test "should show tiposdeidentificacion" do
    get :show, id: @tiposdeidentificacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tiposdeidentificacion
    assert_response :success
  end

  test "should update tiposdeidentificacion" do
    put :update, id: @tiposdeidentificacion, tiposdeidentificacion: { descripcion: @tiposdeidentificacion.descripcion, sigla: @tiposdeidentificacion.sigla }
    assert_redirected_to tiposdeidentificacion_path(assigns(:tiposdeidentificacion))
  end

  test "should destroy tiposdeidentificacion" do
    assert_difference('Tiposdeidentificacion.count', -1) do
      delete :destroy, id: @tiposdeidentificacion
    end

    assert_redirected_to tiposdeidentificaciones_path
  end
end
