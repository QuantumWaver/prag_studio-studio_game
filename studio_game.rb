require_relative 'game'


the_game = Game.new("winterfell")

# the_game.add_player( Player.new("Eddard", 125) )
# the_game.add_player( Player.new("Rob", 90) )
# the_game.add_player( Player.new("Jon") )

the_game.load_players(ARGV.shift || "got_players.txt")

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
