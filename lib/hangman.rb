class Game
  @@dictionary = File.read('word_list.txt').split($/).filter { |w| w.length.between?(5, 12) }

  def initialize
    @secret_word = @@dictionary.sample
    @guesses_left = 10
    @broken_word = Array.new(@secret_word.length, '_')
    @secret_word_arr = @secret_word.split('')
  end

  def play_game
    until @guesses_left.zero?
      display_game_state
      handle_player_input

      @guesses_left -= 1
      break if @secret_word_arr == @broken_word
    end
  end

  private

  def display_game_state
    puts "You have #{@guesses_left} guesses left, guess a letter"
    puts "            #{@broken_word.join(' ')}"
  end

  def handle_player_input
    @guess = gets.chomp.downcase
    @secret_word_arr.each_with_index { |c, i| @broken_word[i] = @guess if c == @guess }
  end

  def display_result
    puts @secret_word_arr == @broken_word ? 'You win!' : 'You lose!'
    puts "The secret word was #{@secret_word}"
  end
end

game = Game.new
game.play_game
game.display_result
