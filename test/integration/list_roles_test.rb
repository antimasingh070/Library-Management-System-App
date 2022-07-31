require 'test_helper'

class ListRolesTest < ActionDispatch::IntegrationTest
  def setup
    @role = Role.create(role: "Member")
    @role2 = Role.create(role: "Librarian")
  end

  test "should show roles listing" do
    get '/roles'
    assert_select "a[href=?]", role_path(@role), text: @role.role
    assert_select "a[href=?]", role_path(@role2), text: @role2.role
  end
end