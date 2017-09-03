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

  def play
    puts "Game #{@title} started on #{Time.now.strftime("%A %m/%d/%Y at %-l:%M%p")}"
    puts "There are #{@players.size} players:"
    @players.each do |player|
      puts "\t#{player}"
    end
    puts

    @players.each do |player|
      GameTurn.take_turn(player)
      puts "#{player}\n\n"
    end
  end
end