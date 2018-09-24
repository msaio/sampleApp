require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end  

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    # empty input from user
    post login_path, params: {session: {email: "", password: ""}}
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login2 with invalid information" do
    get anotherlogin_path
    assert_template 'sessions/anothernew'
    post anotherlogin_path, params: {session: {email: "", password: ""}}
    assert_template 'sessions/anothernew'
    assert_not flash.empty?
    get root_path
    assert flash.empty? 
  end

  test "login with valid information" do
    get login_path
    post login_path, params: {session: {email: @user.email, password: 'password'}}
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path, count: 1 
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", root_path, count: 2
  end
end
