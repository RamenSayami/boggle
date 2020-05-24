require 'test_helper'

class CorrectWordsControllerTest < ActionDispatch::IntegrationTest
  test "checking a correct word in the database" do
    post "/boards/1/correct_words/",
        params: {"word" => "PEA"},
        as: :json
    json_response = JSON.parse(response.body)
    puts json_response
    assert_response :success
  end

  test "checking a correct word not in the database" do
    post "/boards/1/correct_words/",
        params: {"word" => "TOSS"},
        as: :json
    json_response = JSON.parse(response.body)
    puts json_response
    assert_response :success
  end

  test "checking a correct word not present in the board" do
    post "/boards/1/correct_words/",
        params: {"word" => "EXAMPLE"},
        as: :json
    json_response = JSON.parse(response.body)
    puts json_response
    assert_response :bad_request
  end

  test "checking an incorrect word not present in the board" do
    post "/boards/1/correct_words/",
        params: {"word" => "asdasd"},
        as: :json
    json_response = JSON.parse(response.body)
    puts json_response
    assert_response :bad_request
  end

  test "checking an incorrect word in the board" do
    post "/boards/1/correct_words/",
        params: {"word" => "icls"},
        as: :json
    json_response = JSON.parse(response.body)
    puts json_response
    assert_response :not_acceptable
  end

end
