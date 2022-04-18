class User < ApplicationRecord
  validates :email,
            format: { with: /[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+/, message: "Email invalid"  },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 254 }
  has_many :user_words, dependent: :destroy
  has_many :words, through: :user_words, dependent: :destroy
  has_many :game_sessions


end
