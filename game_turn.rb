require_relative 'player'
require_relative 'die'
require_relative "treasure_trove"

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

    treasure = TreasureTrove.random
    puts "#{player.name} found a #{treasure.name} worth #{treasure.points}!"

    puts player
  end

end