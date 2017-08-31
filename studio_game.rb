greeting = "Welcome to THE GAME!"

3.times do
  puts greeting.upcase
end

puts "Time Started: #{Time.now}"


player_one_name = 'larry'
player_one_health = 60

player_two_name = 'curly'
player_two_health = 60

player_three_name = 'moe'
player_three_health = 60


puts "#{player_one_name}'s health is #{player_one_health}"

puts "Players:\n\t#{player_one_name}\n\t#{player_two_name}\n\t#{player_three_name}"
