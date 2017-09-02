require_relative 'player'

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
      player.hit
      player.hit
      player.heal
      puts player
    end
  end
end