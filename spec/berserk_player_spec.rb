require_relative '../berserk_player'

describe BerserkPlayer do

  before do
    $stdout = StringIO.new
    @initial_health = 150
    @player = BerserkPlayer.new("jeff", @initial_health)
  end

  it "goes beserk after #{BerserkPlayer::BERSERK_THRESHOLD} heals" do
    expect(@player).to_not be_berserk

    BerserkPlayer::BERSERK_THRESHOLD.times { @player.heal }
    expect(@player).to_not be_berserk

    @player.heal
    expect(@player).to be_berserk
  end

  it "once beserk all hits become heals" do
    (BerserkPlayer::BERSERK_THRESHOLD + 1).times { @player.heal }
    expect(@player).to be_berserk

    healed_health = @player.health + (Player::HEAL_AMT * 2)
    2.times { @player.hit }
    expect(@player.health).to eq(healed_health)
  end

end