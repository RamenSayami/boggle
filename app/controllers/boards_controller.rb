class BoardsController < ApplicationController
    def index
        boards = Board.all
        render json: {status:'SUCCESS', message: 'asdasd' , data: boards}, status: :ok
    end

    def show
        board =Board.find(params[:id])
        squares = Square.references(board)
        render json: {status:'SUCCESS', message: 'asdasd' , board: board, squares:squares}, status: :ok
    end
end
