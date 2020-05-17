class CorrectWordsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        payload = JSON.parse(request.raw_post);
        #TODO: evaluate if the word supplied is valid from the board.

        @board = Board.find(params[:board_id])
        puts "[LOG] Word to evaluate " +payload["word"].upcase;
        valid = validateWordFromBoard(@board, payload["word"].upcase);
        puts "[LOG] Validated Word = " + valid.to_s;
        if(valid) 
            @board.correct_words.each{ |correct_word|
                if(payload["word"].upcase == correct_word.word.upcase) then
                    render json: {status:true }, status: :ok and return
                end
            }
        else 
            render json: {status:'FAILURE', word: payload["word"], message: "Please enter word from board!"}, status: :bad_request and return
        end
        #TODO: word api here, 

        render json: {status:'FAILURE', word: payload["word"], message: "Incorrect Word!"}, status: :not_acceptable and return
    end

    private 
    def validateWordFromBoard(board, word) 
        puts "[LOG] Validating word..."
        letters = word.split("");
        firstSquares = findLettersInBoard(board, letters[0]);
        tiles = convertBoardTo2dArray(board);
        puts "[LOG] Found " + firstSquares.length.to_s + " letter tiles"

        validWord = false;
        i =1;
        firstSquares.each {|firstSquare|
            puts "[LOG" + i.to_s + "]"
            if(trackOtherLetters(tiles, firstSquare, letters, 1)) 
                validWord = true;
            end
            i+=1;
        }
        return validWord;
    end

    private 
    def findLettersInBoard(board, letter)
        puts "[LOG] Finding first letter tiles"
        firstTiles = Array.new();
        board.squares.each{|square|
            if (square.character == letter) then
                firstTiles.push(square)
            end
        }
        return firstTiles;
    end
    
    private 
    def convertBoardTo2dArray(board) 
        puts "[LOG] converting board to 2D array.."
        tiles = Array.new(4){Array.new(4)}
        board.squares.each{ |square|
            tiles[square.i][square.j] = square.character;
        }
        return tiles;
    end

    private
    def trackOtherLetters(tiles, square, letters, index)
        puts " "
        puts "[LOG] tracking next tile for " + square.i.to_s + "," + square.j.to_s + "=" + square.character
        puts "[INFO] searching for " + letters[index]
        rowStart = (square.i - 1 <0) ? 0 : square.i - 1
        rowEnd = (square.i + 1 ) > 3 ? 3 : square.i + 1
        puts "{LOG} StartRow:" + rowStart.to_s + " EndRow:" + rowEnd.to_s

        colStart = (square.j - 1 <0) ? 0 : square.j - 1
        colEnd = (square.j + 1 ) > 3 ? 3 : square.j + 1
        puts "{LOG} StartCol:" + colStart.to_s + " EndCol:" + colEnd.to_s

        validatorArray = [];
        loopFinishedFlag = false;
        for i in rowStart..rowEnd do
            for j in colStart..colEnd do
                if(i == square.i && j == square.j)
                    puts "Same  tile " + i.to_s + "," + j.to_s + "=" + tiles[i][j] + " ? " + letters[index]
                else
                    puts "Check tile " + i.to_s + "," + j.to_s + "=" + tiles[i][j] + " ? " + letters[index]
                    if(tiles[i][j] == letters[index])
                        puts "[INFO] found " + letters[index] + " at (" + i.to_s + "," + j.to_s + ")"
                        loopFinishedFlag = true;
                        puts "letters.length = " + letters.length.to_s
                        puts "index = " + index.to_s
                        
                        if(letters.length-1 == index)
                            return true;
                        else
                            newSquare = Square.new
                            newSquare.i = i;
                            newSquare.j = j;
                            newSquare.character = tiles[i][j];
                            return trackOtherLetters(tiles, newSquare, letters, index + 1)
                            break;
                        end                        
                    end
                end
            end
        end
        return false;
    end

end




    # private
    # def trackOtherLetters(firstSquare, board, letters)
    #     puts "[LOG] Tracking other letters from " + firstSquare.i.to_s + "," + firstSquare.j.to_s
    #     isFirstLetter = true;
    #     currentTile = firstSquare;
    #     pretendI = square.i;
    #     pretendJ = square.j;
        
    #     letters.each { |letter|
    #         if(isFirstLetter)
    #             isFirstLetter = false;
    #         else  
    #             if(square.i > 0) 
    #                 pretendI = square.i -1;
    #                 for()
    #             end
    #         end
    #     }
    # end