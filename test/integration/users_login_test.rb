require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # Testing for user login using the following sequence :
  # Visit the login path.
  # Post valid information to the sessions path.
  # Verify that the login link disappears.
  # Verify that a logout link appears
  # Verify that a profile link appears.

  def setup
    @user = users(:john)
  end

  test "login with valid information" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                            password: 'password' } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    end
end
