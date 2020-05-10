class CorrectWordsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        payload = JSON.parse(request.raw_post);
        #TODO: evaluate if the word supplied is valid from the board.

        @board = Board.find(params[:board_id])
        @board.correct_words.each{ |correct_word|
            puts correct_word.word;
            if(payload["word"] == correct_word.word) then
                render json: {status:'SUCCESS', word: payload["word"], message: "Correct Word!"}, status: :ok and return
            end
        }
        #TODO: word api here, 

        render json: {status:'FAILURE', word: payload["word"], message: "Incorrect Word!"}, status: :not_acceptable and return
    end

end
