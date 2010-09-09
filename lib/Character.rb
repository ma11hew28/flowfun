class Character
  attr_reader :name
  attr_accessor :health, :strength  

  def name=(name)
    if name.nil? or name.empty?
      raise ArgumentError.new('You must have a name.')
    end
    @name = name
  end

  def initialize(name, health=90, strength=50)
    self.name = name
    @health   = health
    @strength    = strength
  end

  def attack(target, damage)
    target.health -= damage
    return damage
  end

  def alive?
    self.health > 0
  end
end
