class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.
  attr_accessor :word
  attr_accessor :guess
  attr_accessor :wrong_guesses
  attr_accessor :check_win_or_lose
  attr_accessor :word_with_guesses

  # Get a word from remote "random word" service

   def initialize(word, guess = '',  wrong_guesses = '',check_win_or_lose = '', word_with_guesses = '')
     @word = word
     @guess = guess
     @wrong_guesses = ''
     @check_win_or_lose = ''
     @word_with_guesses = ''
  end
  
  def initialize(word)
    @word = word
  end

  # You can test it by running $ bundle exec irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> HangpersonGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.new('watchout4snakes.com').start { |http|
      return http.post(uri, "").body
    }
  end

end
