require_relative 'player'
require_relative 'die'

module GameTurn

  def self.take_turn(player)
    dice = Die.new(1..6)
    case dice.roll
    when 1..2
      player.hit
    when 3..4
      puts "#{player.name} was skipped"
    else
      player.heal
    end
  end

end