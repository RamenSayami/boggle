class CreateSquares < ActiveRecord::Migration[6.0]
  def change
    create_table :squares do |t|
      t.integer :i
      t.integer :j
      t.string :character
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
