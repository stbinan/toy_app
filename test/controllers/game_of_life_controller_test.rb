require 'test_helper'

class GameOfLifeControllerTest < ActionController::TestCase
  test "should get conway" do
    get :conway
    assert_response :success
  end

end
