module Playable

  HIT_DAMAGE = 10
  HEAL_AMT = 15

  def strong?
    self.health > 100
  end

  def hit
    self.health -= HIT_DAMAGE
    puts "#{self.name} got hit!"
  end

  def heal
    self.health += HEAL_AMT
    puts "#{self.name} got healed!"
  end

end