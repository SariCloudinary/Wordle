# app/services/unseen_word_finder.rb
  class UnseenWordFinder < ApplicationService
    attr_reader :player_id

    def initialize(args)
      @player_id = args[:player_id]
    end

    def call(*args)
      find
    end

    private

    def find
      # get all seen words
      seen_words = UserWord.where(:user_id => @player_id).collect { |uw| uw.word_id }
      non_seen_word = Word.where.not(id: seen_words).first

      rescue ActiveRecord::RecordNotUnique => e
      # handle duplicate entry
    end
  end


