require 'test_helper'

class RoleTest < ActiveSupport::TestCase

  def setup
    @role = Role.new(role: "Member")
  end

  test "role should be valid" do
    assert @role.valid?
  end

  test "name should be present" do
    @role.name = " "
    assert_not @role.valid?
  end

  test "name should be unique" do
    @role.save
    @role2 = Role.new(role: "Member")
    assert_not @role2.valid?
  end

  test "name should not be too long" do
    @role.name = "a" * 26
    assert_not @role.valid?
  end

  test "name should not be too short" do
    @role.name = "aa"
    assert_not @role.valid?
  end

end