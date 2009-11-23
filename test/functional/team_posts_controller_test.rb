require 'test_helper'

class TeamPostsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:team_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create team_post" do
    assert_difference('TeamPost.count') do
      post :create, :team_post => { }
    end

    assert_redirected_to team_post_path(assigns(:team_post))
  end

  test "should show team_post" do
    get :show, :id => team_posts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => team_posts(:one).to_param
    assert_response :success
  end

  test "should update team_post" do
    put :update, :id => team_posts(:one).to_param, :team_post => { }
    assert_redirected_to team_post_path(assigns(:team_post))
  end

  test "should destroy team_post" do
    assert_difference('TeamPost.count', -1) do
      delete :destroy, :id => team_posts(:one).to_param
    end

    assert_redirected_to team_posts_path
  end
end
