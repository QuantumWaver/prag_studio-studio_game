greeting = "Welcome to THE GAME!"

3.times do
  puts greeting.upcase
end

puts "Game Started on #{Time.now.strftime("%A %m/%d/%Y at %-l:%M%p")}"


player_1_name = 'larry'
player_1_health = 60

player_2_name = 'curly'
player_2_health = 125

player_3_name = 'moe'
player_3_health = 100

player_4_name = 'shemp'
player_4_health = 90

puts "#{player_1_name.capitalize} has a health of #{player_1_health}."
puts "#{player_2_name.upcase} has a health of #{player_2_health}."
puts "#{player_3_name.capitalize} has a health of #{player_3_health}.".center(50, '*')
puts "#{player_4_name.capitalize.ljust(30, '.')} #{player_4_health} health"

puts "#{player_2_health.to_s.reverse.to_i}"

# puts "#{player_one_name}'s health is #{player_one_health}"

# puts "Players:\n\t#{player_one_name}\n\t#{player_two_name}\n\t#{player_three_name}"
