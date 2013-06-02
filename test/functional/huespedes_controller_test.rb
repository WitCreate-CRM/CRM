require 'test_helper'

class HuespedesControllerTest < ActionController::TestCase
  setup do
    @huesped = huespedes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:huespedes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create huesped" do
    assert_difference('Huesped.count') do
      post :create, huesped: { direccion: @huesped.direccion, documento: @huesped.documento, email: @huesped.email, fecha_nacimiento: @huesped.fecha_nacimiento, primer_apellido: @huesped.primer_apellido, primer_nombre: @huesped.primer_nombre, segundo_apellido: @huesped.segundo_apellido, segundo_nombre: @huesped.segundo_nombre }
    end

    assert_redirected_to huesped_path(assigns(:huesped))
  end

  test "should show huesped" do
    get :show, id: @huesped
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @huesped
    assert_response :success
  end

  test "should update huesped" do
    put :update, id: @huesped, huesped: { direccion: @huesped.direccion, documento: @huesped.documento, email: @huesped.email, fecha_nacimiento: @huesped.fecha_nacimiento, primer_apellido: @huesped.primer_apellido, primer_nombre: @huesped.primer_nombre, segundo_apellido: @huesped.segundo_apellido, segundo_nombre: @huesped.segundo_nombre }
    assert_redirected_to huesped_path(assigns(:huesped))
  end

  test "should destroy huesped" do
    assert_difference('Huesped.count', -1) do
      delete :destroy, id: @huesped
    end

    assert_redirected_to huespedes_path
  end
end
