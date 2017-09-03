require_relative 'player'

describe Player do

  before do
    $stdout = StringIO.new
    @initial_health = 150
    @player = Player.new("jeff", @initial_health)
  end

  # leaving off the 'do' code block makes it a pending test
  it "UPGRADE TO LATEST RSPEC AND FIX ERRORS"

  it "has a capitalized title" do
    @player.name.should == "Jeff"
    # for rspec 3: expect(player.name).to eq("Jeff")
  end

  it "has a non-default initial health" do
    @player.health.should == 150
  end

  it "has a string representation" do
    time = Time.now.strftime("%-l:%M:%S%p").downcase
    @player.to_s.should == "I'm #{@player.name} with a health of " +
                           "#{@player.health} and a score of #{@player.score} " +
                           "as of #{time}"
  end

  it "computes a score as the sum of its health and length of name" do
    @player.score.should == @player.health + @player.name.length
  end

  it "increases health by 15 when healed" do
    @player.heal
    @player.health.should == @initial_health + 15
  end

  it "decreases health by 10 when hit" do
    @player.hit
    @player.health.should == @initial_health - 10
  end

  context "created with a default health" do
    before do
      @player = Player.new("jeff")
    end

    it "has a health of 100" do
      @player.health.should == 100
    end
  end

end