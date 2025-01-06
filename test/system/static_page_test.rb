require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "can log in" do
    user = create(:user)

    visit login_page_path

    fill_in "Password", with: user.password
    fill_in "Username", with: user.username
    click_on "Login"

    assert_text "Host a game"
    assert_text "Join a game"
    assert_text "Play offline"
    assert_text "Tutorial game"
  end

  test "will reject invalid logins" do
    user = create(:user, username: "username")

    visit login_page_path

    fill_in "Password", with: user.password
    fill_in "Username", with: "wrong username"
    click_on "Login"

    assert_text "Invalid username or password"
  end
end
