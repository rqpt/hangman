dictionary = File.read('word_list.txt').split($/).filter { |w| w.length.between?(5, 12) }
secret_word = dictionary.sample

guesses_left = 10
broken_word = Array.new(secret_word.length, '_')
secret_word_arr = secret_word.split('')

until guesses_left.zero?
  puts "You have #{guesses_left} guesses left, guess a letter"
  puts "            #{broken_word.join(' ')}"
  guess = gets.chomp

  secret_word_arr.each_with_index { |c, i| broken_word[i] = guess if c == guess }
  guesses_left -= 1

  break if secret_word_arr == broken_word
end

puts secret_word_arr == broken_word ? 'You win!' : 'You lose!'
puts "The secret word was #{secret_word}"
