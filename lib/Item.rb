class Item
  attr_accessor :name, :power

  def initialize(name, power)
    @name = name
    @power = power
  end
  
  def to_s
    self.name
  end
end

# Add method to list Enumerable objects
Enumerable.module_eval do
  def list(ordered=true)
    if ordered
      self.each_with_index { |obj, i| puts "  #{i+1}. #{obj.to_s}" }
    else
      self.each { |obj| puts "  - #{obj.to_s}" }
    end
  end
end
