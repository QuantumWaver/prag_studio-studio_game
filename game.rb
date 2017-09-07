require_relative 'game_turn'
require 'csv'

class Game
  include Enumerable

  attr_reader :title

  def initialize(title)
    @title = title.upcase
    @players = []
    @total_rounds = 0
  end

  def add_player(player)
    @players << player
  end

  def load_players( filename = "got_players.txt" )
    CSV.foreach(filename).each do |row|
      unless row.empty?
        add_player( Player.new(row[0], Integer(row[1])) )
      end
    end
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
    @total_rounds += finished_rounds

    puts "\nGame Over after #{finished_rounds} rounds!!"
  end

  def total_points
    @players.reduce(0) { |sum, player| sum += player.points }
  end

  def print_stats
    puts "\n#{self.title} Statistics after #{@total_rounds} total rounds:"
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

    puts "\nHigh Scores:"
    puts get_formatted_high_scores_list
  end

  def save_high_scores( filename = "high_scores.txt" )
    File.open(filename, "w") do |file|
      file.puts "#{self.title} High Scores (#{Time.now.strftime("%m/%d/%Y %-l:%M%p")}):"
      file.puts get_formatted_high_scores_list
    end
  end

  def get_formatted_high_scores_list
    scores = ""
    @players.sort.reverse.each do |player|
      formated_name = player.name.ljust(20, '.')
      scores += "#{formated_name} #{player.score}\n"
    end
    scores
  end

  def each
    @players.each do |player|
      yield player
    end
  end
end


# here '__FILE__' holds the name of the file "game.rb",
# and '$0' holds the name of the currently running Ruby program file
# so this code will only be executed if you just run the "game.rb" file
if __FILE__ == $0 # or $PROGRAM_NAME
  game = Game.new("rush")
  game.load_players("rush_players.txt")

  game.play(3) { game.total_points > 600 }
  game.print_stats

  p game.select { |player| player.health > 150 }

end