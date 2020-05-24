require 'test_helper'

class BoardsControllerTest < ActionDispatch::IntegrationTest

  test "should get 1st board" do
    @board = boards(:board1)

    @squares = Square.references(@board)
    get('/boards/1')
    json_response = JSON.parse(response.body)

    board_res = json_response["board"]
    squares_res = json_response["squares"]

    assert_equal(@squares.length, squares_res.length)
    assert_equal(@board.title, board_res["title"])
    
    assert_response :success
  end
end
