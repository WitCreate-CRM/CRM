require 'test_helper'

class ObsequiosControllerTest < ActionController::TestCase
  setup do
    @obsequio = obsequios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:obsequios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create obsequio" do
    assert_difference('Obsequio.count') do
      post :create, obsequio: { descripcion: @obsequio.descripcion }
    end

    assert_redirected_to obsequio_path(assigns(:obsequio))
  end

  test "should show obsequio" do
    get :show, id: @obsequio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @obsequio
    assert_response :success
  end

  test "should update obsequio" do
    put :update, id: @obsequio, obsequio: { descripcion: @obsequio.descripcion }
    assert_redirected_to obsequio_path(assigns(:obsequio))
  end

  test "should destroy obsequio" do
    assert_difference('Obsequio.count', -1) do
      delete :destroy, id: @obsequio
    end

    assert_redirected_to obsequios_path
  end
end
