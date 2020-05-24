require 'test_helper'

class BoardsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get 1st board" do
    @board = boards(:board1)

    @squares = squares.board(@board)
    get('/boards/1')
    puts "calling get /boards/1 url"
    json_response = JSON.parse(response.body)

    board_res = json_response["board"]
    squares_res = json_response["squares"]
    puts board_res
    puts 'response length'
    puts squares_res.length
    puts 'board length'
    puts @squares.length

    # assert_equal(@squares.length, squares_res.length)
    assert_equal(@board.title, board_res["title"])
    
    assert_response :success
  end
end
