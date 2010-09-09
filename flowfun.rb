# FlowFun: A fun command-line RPG written in Ruby
# Matt Di Pasquale
# gmail: liveloveprosper
# September 4, 2010

Dir["lib/*\.rb"].each { |file| require file }

# Create items frow which the player can choose
free_items = [
  Item.new('stick', 30),
  Item.new('rock', 60),
  Item.new('banana', 10),
]

# Introduction
system("clear")
print "=== FLOW FUN ===

Enter your name: "
player = Player.new(gets.chomp, 66, 40)
system("clear")

print "Hi #{player.name}! It's October 13th of the year 2012, and you've finally finished
building the Time Machine. Your health is not so hot (#{player.health}%) because you are
sleep deprived from working so hard on the Time Machine and you have been
eating lots of unhealthy take-out food. Your strength is below average (#{player.strength}%)
since you don't work out much.

Satisfied with your creation, you decide it's now time to test it out. You're
confident in your engineering and certain that any side-effects will only last
for the time it'll take you to get back to now. So, you decide to go back to
yesterday. Hold your breath, and press enter! "

gets
system("clear")

player.health = 100
player.strength = 90
enemy = Enemy.new("Human", 80, nil)

puts "FLASH!!!

You look around you and realize you're in a jungle. That's odd because you
don't remember being in a jungle yesterday, although your room was a bit
messy.

You look down and realize your hands are big, black, and hairy. You're a
gorilla! You're health is now #{player.health}% because gorillas naturally have a
healthy, whole, plant-based diet, and they go to sleep at sundown and rise at
sunup. Your strength is #{player.strength}% because gorillas are often moving about,
getting a natural workout, and thus, are very strong animals.

There are other gorillas around you, but you suddenly hear strange rustling in
the bushes 20 feet behind you.

In front of you, there are #{free_items.length} items:"
free_items.list

# Collect items loop
while true
  print "\nEnter the number of the one you want: "
  selected_item_index = gets.to_i-1
  system("clear")
  player.collect_item free_items[selected_item_index]
  free_items.delete_at selected_item_index

  puts "You now have the following items:"
  player.items.list false
  break if free_items.length === 0

  print "\nWould you like to collect another item? [yes/no]: "
  break unless gets.chomp == "yes"
  system("clear")

  puts "There are now #{free_items.length} items in front of you:"
  free_items.list
end

# Done collecting items.
system("clear")
puts "Now that you're finished collecting items, you turn around and see #{enemy.name}.
Instinctively, your body floods with fear because humans are your main
predator. And, although you're a strong gorilla, you tend to be docile.
But you're the silverback of your group so your duty is to protect the
others. If you run, you'll be letting them down. You must attack."

# Battle loop
while true
  puts "\nYou have the following items:"
  player.items.list
  print "\nEnter the number of the item you'd like to use to attack: "
  player.select_item(gets.to_i-1)
  system("clear")

  print "You attack #{enemy.name} with the #{player.selected_item.name} and "
  damage = player.attack enemy
  if enemy.alive?
    puts "take off #{damage} percentage points."
  else
    puts "kill him.\n\nYou win!\n
The other gorillas of your group screech in joy & jump on you to celebrate.\n
Enjoy the day as a gorilla."
    break
  end
  puts "\nHis health is now at #{enemy.health}%."

  print "\nBrace yourself for #{enemy.name}'s attack. Hit enter when ready. "
  gets
  system("clear")

  print "#{enemy.name} attacks "
  damage = enemy.attack player
  if player.alive?
    puts "you and takes off #{damage} percentage points."
  else
    puts "and kills you.\n\nGame Over!\n\nYour hands & feet will be severed & sold as ashtrays & souvenirs."
    break
  end
  puts "\nYour health is now at #{player.health}%."
end

puts "\nThanks for playing, #{player.name}. :)\n\n"
