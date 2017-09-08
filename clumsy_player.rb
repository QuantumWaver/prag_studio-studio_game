require_relative 'player'

module PragStudioGame
  class ClumsyPlayer < Player

    def initialize( name, health=100, boost_factor = 1 )
      super( name, health )
      @boost_factor = boost_factor
    end

    def found_treasure(treasure)
      super( Treasure.new(treasure.name, treasure.points/2) )
    end

    def heal
      @boost_factor.times { super }
    end

  end


  # here '__FILE__' holds the name of the file "player.rb",
  # and '$0' holds the name of the currently running Ruby program file
  # so this code will only be executed if you just run the "player.rb" file
  if __FILE__ == $0 # or $PROGRAM_NAME

    clumsy = ClumsyPlayer.new("klutz")

    hammer = Treasure.new(:hammer, 50)
    clumsy.found_treasure(hammer)
    clumsy.found_treasure(hammer)
    clumsy.found_treasure(hammer)

    crowbar = Treasure.new(:crowbar, 400)
    clumsy.found_treasure(crowbar)

    clumsy.each_found_treasure do |treasure|
      puts "#{treasure.points} total #{treasure.name} points"
    end
    puts "#{clumsy.points} grand total points"

  end
end