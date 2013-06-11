require 'test_helper'

class Telefonos1ControllerTest < ActionController::TestCase
  setup do
    @telefono1 = telefonos1(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:telefonos1)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create telefono1" do
    assert_difference('Telefono1.count') do
      post :create, telefono1: { numero_telefonico: @telefono1.numero_telefonico }
    end

    assert_redirected_to telefono1_path(assigns(:telefono1))
  end

  test "should show telefono1" do
    get :show, id: @telefono1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @telefono1
    assert_response :success
  end

  test "should update telefono1" do
    put :update, id: @telefono1, telefono1: { numero_telefonico: @telefono1.numero_telefonico }
    assert_redirected_to telefono1_path(assigns(:telefono1))
  end

  test "should destroy telefono1" do
    assert_difference('Telefono1.count', -1) do
      delete :destroy, id: @telefono1
    end

    assert_redirected_to telefonos1_path
  end
end
