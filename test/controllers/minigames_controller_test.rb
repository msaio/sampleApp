require 'test_helper'

class MinigamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @minigame = minigames(:one)
  end

  test "should get index" do
    get minigames_url
    assert_response :success
  end

  test "should get new" do
    get new_minigame_url
    assert_response :success
  end

  test "should create minigame" do
    assert_difference('Minigame.count') do
      post minigames_url, params: { minigame: { content: @minigame.content, game_id: @minigame.game_id } }
    end

    assert_redirected_to minigame_url(Minigame.last)
  end

  test "should show minigame" do
    get minigame_url(@minigame)
    assert_response :success
  end

  test "should get edit" do
    get edit_minigame_url(@minigame)
    assert_response :success
  end

  test "should update minigame" do
    patch minigame_url(@minigame), params: { minigame: { content: @minigame.content, game_id: @minigame.game_id } }
    assert_redirected_to minigame_url(@minigame)
  end

  test "should destroy minigame" do
    assert_difference('Minigame.count', -1) do
      delete minigame_url(@minigame)
    end

    assert_redirected_to minigames_url
  end
end
