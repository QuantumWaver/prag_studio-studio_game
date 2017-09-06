require_relative 'game'


the_game = Game.new("winterfell")

the_game.add_player( Player.new("Eddard", 125) )
the_game.add_player( Player.new("Rob", 90) )
the_game.add_player( Player.new("Jon") )

the_game.play(10) { the_game.total_points >= 2000 }
the_game.print_stats

