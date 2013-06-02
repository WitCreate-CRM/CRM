require 'test_helper'

class SugerenciasyquejasControllerTest < ActionController::TestCase
  setup do
    @sugerenciasyqueja = sugerenciasyquejas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sugerenciasyquejas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sugerenciasyqueja" do
    assert_difference('Sugerenciasyqueja.count') do
      post :create, sugerenciasyqueja: { observaciones: @sugerenciasyqueja.observaciones, problemas_en_la_estadia: @sugerenciasyqueja.problemas_en_la_estadia, sugerencias: @sugerenciasyqueja.sugerencias }
    end

    assert_redirected_to sugerenciasyqueja_path(assigns(:sugerenciasyqueja))
  end

  test "should show sugerenciasyqueja" do
    get :show, id: @sugerenciasyqueja
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sugerenciasyqueja
    assert_response :success
  end

  test "should update sugerenciasyqueja" do
    put :update, id: @sugerenciasyqueja, sugerenciasyqueja: { observaciones: @sugerenciasyqueja.observaciones, problemas_en_la_estadia: @sugerenciasyqueja.problemas_en_la_estadia, sugerencias: @sugerenciasyqueja.sugerencias }
    assert_redirected_to sugerenciasyqueja_path(assigns(:sugerenciasyqueja))
  end

  test "should destroy sugerenciasyqueja" do
    assert_difference('Sugerenciasyqueja.count', -1) do
      delete :destroy, id: @sugerenciasyqueja
    end

    assert_redirected_to sugerenciasyquejas_path
  end
end
