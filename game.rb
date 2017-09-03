require_relative 'player'
require_relative 'die'

class Game
  attr_reader :title

  def initialize(title)
    @title = title.upcase
    @players = []
    @dice = Die.new(1..6)
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
      case @dice.roll
      when 1..2
        player.hit
      when 3..4
        puts "#{player.name} was skipped"
      else
        player.heal
      end
      puts player
      puts
    end
  end
end