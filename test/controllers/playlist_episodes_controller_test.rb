require 'test_helper'

class PlaylistEpisodesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get playlist_episodes_new_url
    assert_response :success
  end

  test "should get create" do
    get playlist_episodes_create_url
    assert_response :success
  end

end
