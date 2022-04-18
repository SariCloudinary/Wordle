# app/services/words_difference.rb
  class WordsDifference < ApplicationService
    attr_reader :guessed_word
    attr_reader :target_word


    def initialize(args)
      @guessed_word = args[:guessed_word]
      @target_word = args[:target_word]
    end

    def call(*args)
      find
    end

    private

    def find
      result = [0,0,0,0,0]
      # map chars count in a word
      charsCount = target_word.split('').to_h{|c| [c,target_word.count(c)]}

      guessed_word.split('').each_with_index{ |c, i|
        if target_word[i] == c
         result[i] =2
       elsif !charsCount[c].nil? && charsCount[c] > 0
         result[i] = 1
       end

        charsCount[c] -= 1 if !charsCount[c].nil?
      }

      result
      rescue ActiveRecord::RecordNotUnique => e
      # handle duplicate entry
    end
  end


