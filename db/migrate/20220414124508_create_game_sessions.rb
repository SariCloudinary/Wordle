class CreateGameSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :game_sessions do |t|
      t.string :word
      t.integer :score
      t.boolean :done

      t.timestamps
    end
  end
end
