def computer_turn
  moves = ["r", "p", "s"]
  chosen_move = moves[rand(0..2)]
  return chosen_move
end

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
  def Player.who_wins(input_p, input_c, player, computer)
    if input_p == input_c
      player.increment_draws
      computer.increment_draws
      result = "d"
    elsif (input_p == "r" && input_c == "s") || (input_p == "p" && input_c == "r") || (input_p == "s" && input_c == "p")
      player.increment_wins
      computer.increment_losses
      result = "w"
    else
      computer.increment_wins
      player.increment_losses
      result = "l"
    end
    Player.print_winner(result, player, computer)

  end

  def Player.print_winner(result, player, computer)
    if result == "d"
      puts "It's a draw!"
    elsif result == "w"
      puts "#{player.name} wins!"
    elsif result == "l"
      puts "#{computer.name} wins!"
    end

    puts "Your stats: \nwins: #{player.wins} \nlosses: #{player.losses} \ndraws: #{player.draws}"
  end
end




puts "What is your name?"
name = gets.chomp

player = Player.new(name)
computer = Player.new("Computer")
i = 0
while 1 == 1
  i += 1
  puts "round #{i} start"
  sleep(1)

  puts "rock (r), paper (p), or scissors (s)?"
  player_move = gets.chomp
  computer_move = computer_turn
  sleep(1)
  puts "\n#{player.name} chose: #{player_move}"
  sleep(2)
  puts "\nComputer chose: #{computer_move}\n"
  sleep(1)
  Player.who_wins(player_move, computer_move, player, computer)

  puts "\nPlay again? (y/n)\n"
  if (gets.chomp) == "n"
    break
  end
end

puts "\nGame over!"
sleep(1)
puts "\nYour stats: \nwins: #{player.wins} \nlosses: #{player.losses} \ndraws: #{player.draws}"
sleep(1)
puts "\nThanks for playing, #{player.name}."
