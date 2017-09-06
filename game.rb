require_relative 'game_turn'

class Game
  attr_reader :title

  def initialize(title)
    @title = title.upcase
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    puts "Game #{@title} started on #{Time.now.strftime("%A %m/%d/%Y at %-l:%M%p")}"
    puts "There are #{@players.size} players:"
    @players.each do |player|
      puts "\t#{player}"
    end

    TreasureTrove.print_treasures

    finished_rounds = 0
    1.upto(rounds) do |count|
      end_game = block_given? ? yield : false
      unless end_game
        puts "\nRound #{count}"
        @players.each do |player|
          GameTurn.take_turn(player)
        end
        finished_rounds += 1
      end
    end

    puts "\nGame Over after #{finished_rounds} rounds!!"
  end

  def total_points
    @players.reduce(0) { |sum, player| sum += player.points }
  end

  def print_stats
    puts "\n#{self.title} Statistics:"
    strong, weak = @players.partition { |player| player.strong? }

    puts "\n#{strong.length} strong players:"
    sorted = strong.sort { |p1, p2| p2.health <=> p1.health }
    sorted.each { |p| p.print_name_and_health }

    puts "\n#{weak.length} weak players:"
    sorted = weak.sort { |p1, p2| p1.health <=> p2.health }
    sorted.each { |p| p.print_name_and_health }

    sorted = @players.sort { |p1, p2| p2.points <=> p1.points }
    sorted.each do |player|
      puts "\n#{player.name} has #{player.points} total points:"
      player.each_found_treasure do |treasure|
        puts "\t#{treasure.points} total #{treasure.name} points"
      end
    end

    puts "\n#{total_points} total points from all treasures found"


    puts "\nHigh Scores"
    @players.sort.each do |player|
      formated_name = player.name.ljust(20, '.')
      puts "#{formated_name} #{player.score}"
    end
  end
end


# here '__FILE__' holds the name of the file "game.rb",
# and '$0' holds the name of the currently running Ruby program file
# so this code will only be executed if you just run the "game.rb" file
if __FILE__ == $0 # or $PROGRAM_NAME
  game = Game.new("rush")
  game.add_player(Player.new( "geddy", 120 ))
  game.add_player(Player.new( "Neil", 60 ))
  game.add_player(Player.new( "Alex", 133 ))

  game.play(3) { game.total_points > 800 }

  game.print_stats

end