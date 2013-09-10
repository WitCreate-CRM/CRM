require 'test_helper'

class UltimavisitasControllerTest < ActionController::TestCase
  setup do
    @ultimavisita = ultimavisitas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ultimavisitas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ultimavisita" do
    assert_difference('Ultimavisita.count') do
      post :create, ultimavisita: { comentario: @ultimavisita.comentario, contacto: @ultimavisita.contacto, fecha: @ultimavisita.fecha, obsequio: @ultimavisita.obsequio, pendiente: @ultimavisita.pendiente, telefono: @ultimavisita.telefono }
    end

    assert_redirected_to ultimavisita_path(assigns(:ultimavisita))
  end

  test "should show ultimavisita" do
    get :show, id: @ultimavisita
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ultimavisita
    assert_response :success
  end

  test "should update ultimavisita" do
    put :update, id: @ultimavisita, ultimavisita: { comentario: @ultimavisita.comentario, contacto: @ultimavisita.contacto, fecha: @ultimavisita.fecha, obsequio: @ultimavisita.obsequio, pendiente: @ultimavisita.pendiente, telefono: @ultimavisita.telefono }
    assert_redirected_to ultimavisita_path(assigns(:ultimavisita))
  end

  test "should destroy ultimavisita" do
    assert_difference('Ultimavisita.count', -1) do
      delete :destroy, id: @ultimavisita
    end

    assert_redirected_to ultimavisitas_path
  end
end
