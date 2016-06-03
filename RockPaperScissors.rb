class Player
  def initialize(name = "Player")
    @name = name
    @wins = 0
    @losses = 0
    @draws = 0
  end
  def increment_wins
    @wins += 1
  end
  def increment_losses
    @losses += 1
  end
  def increment_draws
    @draws += 1
  end
  attr_reader :name
  attr_reader :wins
  attr_reader :losses
  attr_reader :draws
end

class Game
  @player
  @computer
  @loop_i
  @result
  @answer
  def init
    puts "What is your name?"
    name = gets.chomp

    @player = Player.new(name)
    @computer = Player.new("Computer")
    @loop_i = 0
  end

  def play
    loop do
      @loop_i += 1
      puts "round #{@loop_i} start"
      sleep(1)
      puts "rock (r), paper (p), or scissors (s)?"
      player_move = gets.chomp
      computer_move = computer_turn
      sleep(1)
      puts "\n#{@player.name} chose: #{player_move}"
      sleep(1.5)
      puts "\nComputer chose: #{computer_move}\n"
      sleep(1)
      who_wins(player_move, computer_move)

      loop do
        puts "\nPlay again? (y/n)\n"
        @answer = gets.chomp
        if !(@answer == "n" || @answer == "y")
          puts "Invalid input"
        else
          break
        end
      end
      if @answer == "n"
        break
      end
    end
    goodbye
  end

  def goodbye
    puts "Thanks for playing, #{@player.name}"
  end

  def computer_turn
    moves = ["r", "p", "s"]
    moves.sample
  end

  def who_wins(input_p, input_c)
    if input_p == input_c
      @player.increment_draws
      @computer.increment_draws
      @result = "d"
    elsif (input_p == "r" && input_c == "s") || (input_p == "p" && input_c == "r") || (input_p == "s" && input_c == "p")
      @player.increment_wins
      @computer.increment_losses
      @result = "w"
    else
      @computer.increment_wins
      @player.increment_losses
      @result = "l"
    end
    print_winner
  end

  def print_winner()
    if @result == "d"
      puts "It's a draw!"
    elsif @result == "w"
      puts "#{@player.name} wins!"
    elsif @result == "l"
      puts "#{@computer.name} wins!"
    end

    puts "Your stats: \nwins: #{@player.wins} \nlosses: #{@player.losses} \ndraws: #{@player.draws}"
  end
end
game = Game.new
game.init
game.play
