require 'test_helper'

class RolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role = Role.create(role: "Member")
    @librarian_user = User.create(username: "Annu Singh", email: "annu@gmail.com",
                              password: "password", librarian: true)
  end

  test "should get index" do
    get roles_url
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@librarian_user)
    get new_role_url
    assert_response :success
  end

  test "should create category" do
    sign_in_as(@librarian_user)
    assert_difference('role.count', 1) do
      post roles_url, params: { role: { role: "Librarian" } }
    end

    assert_redirected_to role_url(Role.last)
  end

  test "should not create role if not librarian" do
    assert_no_difference('Role.count') do
      post roles_url, params: { role: { role: "Librarian"} }
    end

    assert_redirected_to roles_url
  end

  test "should show role" do
    get role_url(@role)
    assert_response :success
  end

 
end