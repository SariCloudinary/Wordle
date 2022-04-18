class AddUserToGameSessions < ActiveRecord::Migration[7.0]
  def change
    add_reference :game_sessions, :user, null: false, foreign_key: true
  end
end
