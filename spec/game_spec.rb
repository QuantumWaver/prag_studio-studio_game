require_relative '../game'

describe Game do

  before do
    $stdout = StringIO.new
    @game = Game.new("game of tests")

    @initial_health = 100
    @player = Player.new("Eddard", @initial_health)

    @game.add_player(@player)
  end

  context "during play" do

    it "players are healed on a roll of 5 or 6" do
      allow_any_instance_of(Die).to receive(:roll).and_return(5)
      @game.play
      current_health = @initial_health + 15
      expect(@player.health).to eq(current_health)

      allow_any_instance_of(Die).to receive(:roll).and_return(6)
      @game.play
      current_health += 15
      expect(@player.health).to eq(current_health)
    end

    it "players are skipped on a roll of 3 or 4" do
      allow_any_instance_of(Die).to receive(:roll).and_return(3)
      @game.play
      expect(@player.health).to eq(@initial_health)

      allow_any_instance_of(Die).to receive(:roll).and_return(4)
      @game.play
      expect(@player.health).to eq(@initial_health)
    end

    it "players are hit on a roll of 1 or 2" do
      allow_any_instance_of(Die).to receive(:roll).and_return(1)
      @game.play
      current_health = @initial_health - 10
      expect(@player.health).to eq(current_health)

      allow_any_instance_of(Die).to receive(:roll).and_return(2)
      @game.play
      current_health -= 10
      expect(@player.health).to eq(current_health)
    end

  end
end