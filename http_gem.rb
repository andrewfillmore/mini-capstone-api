require "http"

system "clear"

puts "Enter a name for a subreddit: "
word = gets.chomp



response = HTTP.get("https://localhost:3000#{word}.json")