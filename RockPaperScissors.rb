def computer_turn
  moves = ["r", "p", s"]
  chosen_move = moves[rand(0..2)]
  return chosen_move
end

def who_wins(player, computer)
  if player == computer
    player.increment_draw
    computer.increment_draw
  end
  if (player == r && computer == s) || (player == p && computer = r) || (player == s && computer = p)
    player.increment_draw
    puts "#{player.name
end


  
class Player(name)
  def initialize(name = "Player)
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
  def Player.who_wins(input_p, input_c)
    if input_p == input_c
      player.increment_draw
      computer.increment_draw
    elsif (input_p == r && input_c == s) || (input_p == p && input_c = r) || (input_p == s && input_c = p)
      player.increment_wins
      computer.increment_losses
    else
      computer.increment_wins
      player.increment_losses
    end
    
end




puts "What is your name?"
name = gets.chomp

player = Player.new(name)
computer = Player.new("Computer")
i = 0
while 1 == 1
  i += 1
  puts "game #{i} start"
  sleep(1)
  
  puts "rock (r), paper (p), or scissors (s)?
  player_move = gets.chomp
  computer_move = computer_turn
  winner = who_wins(player, computer)

  puts "#{winner}"


