require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params:{user:{name: "",email: "user@invalid", password: "foo", password_confirmation: "bar"}}
    end
    assert_template 'users/new'
    #assert_select 'div#<CSS id for error explanation>'
    #assert_select 'div.<CSS class for field with error>'
  end

  test "invalid sign up information cyak blyat" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: {user:{name: "", email: "user@invalid", password: "fuck", password_confirmation: "you"}}
    end
    #follow_redirect!
    assert_template 'users/new'
  end

  test "invalid signup 2 madafaka" do
    get signup2_path
    assert_no_difference 'User.count', 1 do
      post users_path, params: {user:{name: "", email: "user@invalid", password: "fuck", password_confirmation: "you"}}
    end
    #follow_redirect!
    assert_template 'users/new'
  end


  test "valid sign up information, bitch!!" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: {user:{name: "FuckUBitchFucker", email: "user123123123123@invalid.com", password: "fuckubitch", password_confirmation: "fuckubitch"}}
    end
    follow_redirect!
    assert_template 'users/show'
    # assert_not flash.empty?
    assert is_logged_in?
  end

  test "valid sign up 2 information!!" do
    get signup2_path
    assert_difference "User.count", 1 do
      post users_path, params: {user:{name: "Example User", email: "user@example.com", password: "password", password_confirmation: "password"}}
    end
    follow_redirect!
    # assert_template 'users/showanother'
    assert_template 'users/show'
    assert_not flash.empty?
    assert is_logged_in?
  end

  test "not valid for sure cai dit me may!!" do
    get signup2_path
    #assert_difference 'User.count', 1 do
    assert_no_difference 'User.count', 1 do
      post users_path, params: {user:{name: "", email: "user@invalid", password: "fuck", password_confirmation: "you"}}
    end
    #follow_redirect!
    #assert_template 'users/show'
  end

end