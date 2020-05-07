# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


board = Board.create(title: 'Level 1')

Square.create(
    [
        {
            i: 0,
            j: 0,
            character: 'I',
            board: board
        },
        {
            i: 0,
            j: 1,
            character: 'C',
            board: board
        },
        {
            i: 0,
            j: 2,
            character: 'L',
            board: board
        },
        {
            i: 0,
            j: 3,
            character: 'S',
            board: board
        },
        {
            i: 1,
            j: 0,
            character: 'E',
            board: board
        },
        {
            i: 1,
            j: 1,
            character: 'A',
            board: board
        },
        {
            i: 1,
            j: 2,
            character: 'I',
            board: board
        },
        {
            i: 1,
            j: 3,
            character: 'A',
            board: board
        },
        {
            i: 2,
            j: 0,
            character: 'P',
            board: board
        },
        {
            i: 2,
            j: 1,
            character: 'S',
            board: board
        },
        {
            i: 2,
            j: 2,
            character: 'N',
            board: board
        },
        {
            i: 2,
            j: 3,
            character: 'T',
            board: board
        },
        {
            i: 3,
            j: 0,
            character: 'Q',
            board: board
        },
        {
            i: 3,
            j: 1,
            character: 'S',
            board: board
        },
        {
            i: 3,
            j: 2,
            character: 'O',
            board: board
        },
        {
            i: 3,
            j: 3,
            character: 'I',
            board: board
        }
    ]
)
