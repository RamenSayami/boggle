class CreateCorrectWords < ActiveRecord::Migration[6.0]
  def change
    create_table :correct_words do |t|
      t.string :word
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
