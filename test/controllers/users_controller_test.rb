require 'test_helper'

#class UsersControllerTest < ActionController::TestCase
class UsersControllerTest < ActionDispatch::IntegrationTest


  def setup
    @user = users(:testuser)
    @other_user = users(:testuser2)
  end

  test "should redirect index when not logged in" do
    #get :index
    get users_path
    assert_redirected_to login_url
  end

=begin
  test "should get new" do
    get :new
    assert_response :success
  end
=end

  test "should redirect edit when not logged in" do
    #get :edit, id: @user
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    #patch :update, id: @user, user: {name: @user.name, email: @user.email}
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    #get :edit, id: @user
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    #patch :update, id: @user, user: {name: @user.name, email: @user.email}
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      #delete :destroy, id: @user
      delete user_path(@user)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      #delete :destroy, id: @user
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end

  test "should redirect following when not logged in" do
    #get :following, id: @user
    get followers_user_path(@user)
    assert_redirected_to login_url
  end

  test "should redirect followers when not logged in" do
    #get :followers, id: @user
    get followers_user_path(@user)
    assert_redirected_to login_url
  end
end
