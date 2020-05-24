require 'test_helper'

class BuzzsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @buzz = buzzs(:one)
  end

  test "should get index" do
    get buzzs_url
    assert_response :success
  end

  test "should get new" do
    get new_buzz_url
    assert_response :success
  end

  test "should create buzz" do
    assert_difference('Buzz.count') do
      post buzzs_url, params: { buzz: { content: @buzz.content, name: @buzz.name } }
    end

    assert_redirected_to buzz_url(Buzz.last)
  end

  test "should show buzz" do
    get buzz_url(@buzz)
    assert_response :success
  end

  test "should get edit" do
    get edit_buzz_url(@buzz)
    assert_response :success
  end

  test "should update buzz" do
    patch buzz_url(@buzz), params: { buzz: { content: @buzz.content, name: @buzz.name } }
    assert_redirected_to buzz_url(@buzz)
  end

  test "should destroy buzz" do
    assert_difference('Buzz.count', -1) do
      delete buzz_url(@buzz)
    end

    assert_redirected_to buzzs_url
  end
end
