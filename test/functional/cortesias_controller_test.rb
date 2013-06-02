require 'test_helper'

class CortesiasControllerTest < ActionController::TestCase
  setup do
    @cortesia = cortesias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cortesias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cortesia" do
    assert_difference('Cortesia.count') do
      post :create, cortesia: { botella_de_vino: @cortesia.botella_de_vino, otro_regalo: @cortesia.otro_regalo, tabla_de_queso: @cortesia.tabla_de_queso }
    end

    assert_redirected_to cortesia_path(assigns(:cortesia))
  end

  test "should show cortesia" do
    get :show, id: @cortesia
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cortesia
    assert_response :success
  end

  test "should update cortesia" do
    put :update, id: @cortesia, cortesia: { botella_de_vino: @cortesia.botella_de_vino, otro_regalo: @cortesia.otro_regalo, tabla_de_queso: @cortesia.tabla_de_queso }
    assert_redirected_to cortesia_path(assigns(:cortesia))
  end

  test "should destroy cortesia" do
    assert_difference('Cortesia.count', -1) do
      delete :destroy, id: @cortesia
    end

    assert_redirected_to cortesias_path
  end
end
