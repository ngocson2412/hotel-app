require 'test_helper'

class Admins::ProfileControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admins_profile = admins_profiles(:one)
  end

  test "should get index" do
    get admins_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_admins_profile_url
    assert_response :success
  end

  test "should create admins_profile" do
    assert_difference('Admins::Profile.count') do
      post admins_profiles_url, params: { admins_profile: {  } }
    end

    assert_redirected_to admins_profile_url(Admins::Profile.last)
  end

  test "should show admins_profile" do
    get admins_profile_url(@admins_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_admins_profile_url(@admins_profile)
    assert_response :success
  end

  test "should update admins_profile" do
    patch admins_profile_url(@admins_profile), params: { admins_profile: {  } }
    assert_redirected_to admins_profile_url(@admins_profile)
  end

  test "should destroy admins_profile" do
    assert_difference('Admins::Profile.count', -1) do
      delete admins_profile_url(@admins_profile)
    end

    assert_redirected_to admins_profiles_url
  end
end
