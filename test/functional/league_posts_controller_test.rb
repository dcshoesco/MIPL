require 'test_helper'

class LeaguePostsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:league_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create league_post" do
    assert_difference('LeaguePost.count') do
      post :create, :league_post => { }
    end

    assert_redirected_to league_post_path(assigns(:league_post))
  end

  test "should show league_post" do
    get :show, :id => league_posts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => league_posts(:one).to_param
    assert_response :success
  end

  test "should update league_post" do
    put :update, :id => league_posts(:one).to_param, :league_post => { }
    assert_redirected_to league_post_path(assigns(:league_post))
  end

  test "should destroy league_post" do
    assert_difference('LeaguePost.count', -1) do
      delete :destroy, :id => league_posts(:one).to_param
    end

    assert_redirected_to league_posts_path
  end
end
