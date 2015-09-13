require 'test_helper'

class AdsControllerTest < ActionController::TestCase
  # Test the CRUD scaffolded actions as anon, logged in user and admin
  #

  include Devise::TestHelpers

  setup do
    @ad = FactoryGirl.create(:ad)
    @user = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:admin)
  end

  test "should get index" do
    @request.headers["REMOTE_ADDR"] = "87.223.138.147"
    get :index
    assert_response :success
    assert_not_nil assigns(:ads)
  end

  test "should not get new if not signed in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_url
  end

  test "should get new if signed in" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "should not create ad if not signed in" do
    post :create, ad: { body: "Es una Ferrari de esas rojas, muy linda.", ip: '8.8.8.8', title: 'Regalo Ferrari', type: 1, woeid_code: '788273' }
    assert_redirected_to new_user_session_url
  end

  test "should create ad if logged in" do
    sign_in @user

    assert_difference('Ad.count') do
      post :create, ad: { body: "Es una Ferrari de esas rojas, muy linda.", ip: '8.8.8.8', title: 'Regalo Ferrari', type: 1, woeid_code: '788273' }
    end

    assert_redirected_to adslug_path(assigns(:ad), slug: "regalo-ferrari")
  end

  test "should show ad" do
    get :show, id: @ad.id
    assert_response :success
  end

  test "should not edit any ad as normal user" do
    @ad.user_id = @admin.id
    @ad.save
    sign_in @user
    get :edit, id: @ad
    assert_response :redirect
    assert_redirected_to root_path
  end

  test "should edit my own ad as normal user" do
    @ad.user_id = @user.id
    @ad.save
    sign_in @user
    get :edit, id: @ad
    assert_response :success
  end

  test "should get edit as admin user" do
    sign_in @admin
    get :edit, id: @ad
    assert_response :success
  end

  test "should not update other user ad if normal user" do
    @ad.user_id = @admin.id
    @ad.save
    sign_in @user
    patch :update, id: @ad, ad: { body: @ad.body, ip: @ad.ip, title: @ad.title, type: @ad.type, user_id: @ad.user_id, woeid_code: @ad.woeid_code }
    assert_redirected_to root_url
  end

  test "should update own ads as normal user" do
    sign_in @user
    @ad.user_id = @user.id
    @ad.save

    body = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
    patch :update, id: @ad, ad: { body: body, ip: @ad.ip, title: @ad.title, type: @ad.type, user_id: @ad.user_id, woeid_code: @ad.woeid_code }
    assert_redirected_to ad_path(assigns(:ad))
    @ad.reload
    assert_equal body, @ad.body
  end

  test "should update any ad as admin" do
    sign_in @admin
    patch :update, id: @ad, ad: { body: @ad.body, ip: @ad.ip, title: @ad.title, type: @ad.type, user_id: @ad.user_id, woeid_code: @ad.woeid_code }
    assert_redirected_to ad_path(assigns(:ad))
  end

  test "should not destroy ad as anonymous" do
    assert_difference('Ad.count', 0) do
      delete :destroy, id: @ad
    end

    assert_redirected_to new_user_session_url
  end

  test "should not destroy ad as normal user" do
    sign_in @user
    assert_difference('Ad.count', 0) do
      delete :destroy, id: @ad
    end

    assert_redirected_to root_path
  end

  test "should destroy ad as admin user" do
    sign_in @admin
    assert_difference('Ad.count', -1) do
      delete :destroy, id: @ad
    end

    assert_redirected_to ads_path
  end

end
