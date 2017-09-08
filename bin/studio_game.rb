require_relative '../lib/prag_studio_game/game'
require_relative '../lib/prag_studio_game/clumsy_player'
require_relative '../lib/prag_studio_game/berserk_player'


the_game = PragStudioGame::Game.new("winterfell")

# the_game.add_player( Player.new("Eddard", 125) )
# the_game.add_player( Player.new("Rob", 90) )
# the_game.add_player( Player.new("Jon") )

# Here we create a default_player_file variable that contains the absolute
# directory path to the players.csv file. To get the absolute path, we first
# get the path to the directory that contains the studio_game.rb file
# (remember that the name of the current file is held in the __FILE__ variable).
# Then we tack on the players.csv file name, since it's also in the bin directory.
default_player_file = File.join(File.dirname(__FILE__), 'got_players.txt')


the_game.load_players(ARGV.shift || default_player_file )

klutz = PragStudioGame::ClumsyPlayer.new("klutz", 105, 15)
the_game.add_player(klutz)

berserker = PragStudioGame::BerserkPlayer.new("berserker", 50)
the_game.add_player(berserker)

loop do
  puts "\nHow many rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/  # a number
    the_game.play(Integer(answer))
  when 'quit', 'exit'
    the_game.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

the_game.save_high_scores



# puts "How many rounds?"
# rounds = gets.chomp.to_i
# puts "End at max points:"
# max_points = gets.chomp.to_i
# puts "\nGame will end after #{rounds} rounds, or when #{max_points} points are reached."
# puts "Press \"enter\" to begin."
# gets

# the_game.play(rounds) { the_game.total_points >= max_points }
# the_game.print_stats
