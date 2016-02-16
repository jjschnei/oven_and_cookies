class GuessingGame

  attr_writer :congrats_message #allows for custom message
  attr_reader :remaining_guesses #for driver tests and rspec


  def initialize(secret_num, remaining_guesses)
    @secret_num = secret_num
    @remaining_guesses = remaining_guesses
    @congrats_message = "Yay, you won!"
    @previous_guesses = []
    @has_lost = false
    @has_won = false
  end



  def included_in_previous_guesses?(guess)
    return @previous_guesses.include?(guess)
  end

  def add_to_previous_guesses(guess)
    return @previous_guesses << guess if !included_in_previous_guesses?(guess)
  end

  def game_over?
    return (@has_won || @has_lost)
  end

  def win_or_lose_message
    return "You already #{@has_won ? "won" : "lost"}. The number was #{@secret_num}"
  end

  def wrong_guess_message(guess)
    return guess > @secret_num ? "Too high!" : "Too low!"
  end

  def last_guess_warning
    return @remaining_guesses == 1 ? "  WARNING: only one guess left!" : ""
  end

  def increment_guess_counter(guess)
    return @remaining_guesses -= 1 if !included_in_previous_guesses?(guess)
  end

  def last_or_no_guess?
    return @remaining_guesses <= 1
  end

  def won
    @has_won = true
    return @congrats_message + " The number was #{@secret_num}"
  end

  def lost
    @has_lost = true
    return "You lost! The number was #{@secret_num}"
  end




  def guess(guess)

    return win_or_lose_message if game_over?

    increment_guess_counter(guess)
    add_to_previous_guesses(guess)

    if (guess == @secret_num)
      return won
    elsif @remaining_guesses == 0
      return lost
    else
      return wrong_guess_message(guess) + last_guess_warning
    end

  end


end



sample_game = GuessingGame.new(4, 5)
p sample_game.guess(5)
p sample_game.guess(1)
p sample_game.guess(2)
p sample_game.guess(2)
p sample_game.guess(5)
p sample_game.guess(5)
p sample_game.guess(6)
p sample_game.remaining_guesses
p sample_game.guess(4) #last guess
p sample_game.guess(11)
