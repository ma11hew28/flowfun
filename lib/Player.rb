# Singleton class
class Player < Character
  attr_accessor :items, :selected_item, :selected_item_index
  
  def initialize(name, health, strength)
    super
    @items = []
  end

  def collect_item(item)
    @items.push item
  end
  
  def select_item(item_index)
    self.selected_item_index = item_index
    self.selected_item = items[item_index]
  end

  def attack(target)
    super(target, self.selected_item.power)
  end
end
