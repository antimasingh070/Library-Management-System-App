require 'test_helper'

class CreateRoleTest < ActionDispatch::IntegrationTest

  setup do
    @librarian_user = User.create(username: "Annu Singh", email: "annu@gmail.com",
                              password: "password", librarian: true)
    sign_in_as(@librarian_user)
  end

  test "get new role form and create role" do
    get "/roles/new"
    assert_response :success
    assert_difference 'Role.count', 1 do
      post roles_path, params: { role: { role: "Member"} }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Member", response.body
  end

  test "get new role form and reject invalid role submission" do
    get "/roles/new"
    assert_response :success
    assert_no_difference 'Role.count' do
      post roles_path, params: { role: { role: " "} }
    end
    assert_match "errors", response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end
end