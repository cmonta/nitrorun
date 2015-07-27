require 'test_helper'

class CoureursControllerTest < ActionController::TestCase
  setup do
    @coureur = coureurs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coureurs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coureur" do
    assert_difference('Coureur.count') do
      post :create, coureur: { pseudo: @coureur.pseudo, user_id: @coureur.user_id, ville: @coureur.ville }
    end

    assert_redirected_to coureur_path(assigns(:coureur))
  end

  test "should show coureur" do
    get :show, id: @coureur
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coureur
    assert_response :success
  end

  test "should update coureur" do
    patch :update, id: @coureur, coureur: { pseudo: @coureur.pseudo, user_id: @coureur.user_id, ville: @coureur.ville }
    assert_redirected_to coureur_path(assigns(:coureur))
  end

  test "should destroy coureur" do
    assert_difference('Coureur.count', -1) do
      delete :destroy, id: @coureur
    end

    assert_redirected_to coureurs_path
  end
end
