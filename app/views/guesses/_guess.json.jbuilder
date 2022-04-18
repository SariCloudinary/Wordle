json.extract! guess, :id, :guessed_word, :game_session_id, :user_id, :created_at, :updated_at
json.url guess_url(guess, format: :json)
