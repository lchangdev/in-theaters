require 'json'
require 'pry'
require 'json'
require 'net/http'

if !ENV.has_key?("ROTTEN_TOMATOES_API_KEY")
  puts "You need to set the ROTTEN_TOMATOES_API_KEY environment variable."
  exit 1
end

api_key = ENV["ROTTEN_TOMATOES_API_KEY"]
uri = URI("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=#{api_key}")

response = Net::HTTP.get(uri)
movie_data = JSON.parse(response)

# movie_data = JSON.parse(File.read('in_theaters.json'))

puts "In Theaters Now: "

def average(a,b)
  (a + b) / 2
end

average_rating = {}

movie_data["movies"].each do |x|

  average_score = average(x["ratings"]["critics_score"], x["ratings"]["audience_score"])

  if x["abridged_cast"][1] == nil
    average_rating[average_score] = "#{x["title"]}, #{x["mpaa_rating"]}, #{x["abridged_cast"][0]["name"]}"
  else
    average_rating[average_score] = "#{x["title"]}, #{x["mpaa_rating"]}, #{x["abridged_cast"][0]["name"]}, #{x["abridged_cast"][1]["name"]}, #{x["abridged_cast"][2]["name"]}"
  end

end

average_rating = average_rating.sort_by {|k,v| k}.reverse

Hash[average_rating].each do |k,v|
  puts "#{k} - #{v}"
end

# ==================================================
# list of movies in theatres now

# puts "In Theaters Now: "
# movie_data["movies"].each do |x|
#   puts x["title"]
# end

# MPAA rating along w/ each movies FINISHED

# puts "In Theaters Now: "

# movie_data["movies"].each do |x|
#   puts "#{x["title"]} (#{x["mpaa_rating"]}) "
# end

# ==================================================

# Average of the critics & audience scores

# puts "In Theaters Now: "

# movie_data["movies"].each do |x|
#   puts "#{(x["ratings"]["critics_score"] + x["ratings"]["audience_score"]) / 2 } - \
# #{x["title"]} (#{x["mpaa_rating"]}) "
# end

# ==================================================

# Up to the first three cast members

# puts "In Theaters Now: "

# cast_names1 = []
# cast_names2 = []
# index = 0

# movie_data["movies"].each do |x|

#   if x["abridged_cast"][1] == nil
#     cast_names1 << "none"
#   elsif x["abridged_cast"][1] != nil
#     cast_names1 << x["abridged_cast"][1]["name"]
#   end

#   if x["abridged_cast"][2] == nil
#     cast_names2 << "none"
#   elsif x["abridged_cast"][2] != nil
#     cast_names2 << x["abridged_cast"][2]["name"]
#   end

#   puts "#{(x["ratings"]["critics_score"] + x["ratings"]["audience_score"]) / 2 } - \
# #{x["title"]} (#{x["mpaa_rating"]}) starring #{x["abridged_cast"][0]["name"]}, \
# #{cast_names1[index]}, #{cast_names2[index]}"

#   index += 1
# end

# ==================================================












