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
      @game.play(2)
      current_health = @initial_health + (Player::HEAL_AMT*2)
      expect(@player.health).to eq(current_health)

      allow_any_instance_of(Die).to receive(:roll).and_return(6)
      @game.play(2)
      current_health += (Player::HEAL_AMT*2)
      expect(@player.health).to eq(current_health)
    end

    it "players are skipped on a roll of 3 or 4" do
      allow_any_instance_of(Die).to receive(:roll).and_return(3)
      @game.play(2)
      expect(@player.health).to eq(@initial_health)

      allow_any_instance_of(Die).to receive(:roll).and_return(4)
      @game.play(2)
      expect(@player.health).to eq(@initial_health)
    end

    it "players are hit on a roll of 1 or 2" do
      allow_any_instance_of(Die).to receive(:roll).and_return(1)
      @game.play(2)
      current_health = @initial_health - (Player::HIT_DAMAGE*2)
      expect(@player.health).to eq(current_health)

      allow_any_instance_of(Die).to receive(:roll).and_return(2)
      @game.play(2)
      current_health -= (Player::HIT_DAMAGE*2)
      expect(@player.health).to eq(current_health)
    end

    it "assigns a treasure for points during a player's turn" do
      @game.play(1)
      expect(@player.points).not_to be_zero
    end
  end

  it "computes total points for all treasures found" do
    player2 = Player.new("Rob")
    @game.add_player(player2)
    player3 = Player.new("Jon")
    @game.add_player(player3)

    t1 = Treasure.new(:bow, 100)
    t2 = Treasure.new(:axe, 200)
    t3 = Treasure.new(:sword, 300)

    total_points = 0
    @player.found_treasure(t1)
    total_points += t1.points

    @player.found_treasure(t1)
    total_points += t1.points

    player2.found_treasure(t2)
    total_points += t2.points

    player2.found_treasure(t3)
    total_points += t3.points

    player3.found_treasure(t2)
    total_points += t2.points

    expect(@game.total_points).to eq(total_points)
  end

end