class BoardsController < ApplicationController
    def index
        boards = Board.all
        render json: {status:'SUCCESS', message: 'Returning all boards' , data: boards}, status: :ok
    end

    def show
        board =Board.find(params[:id])
        squares = Square.references(board)
        render json: {status:'SUCCESS', message: 'Returning Specific board' , board: board, squares:squares}, status: :ok
    end
end
