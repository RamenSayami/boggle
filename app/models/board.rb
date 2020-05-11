class Board < ApplicationRecord
    has_many :squares
    has_many :correct_words
end
