class Guess < ApplicationRecord
  belongs_to :game_session
  belongs_to :user

  validates :guessed_word, length: {is: 5}
end
