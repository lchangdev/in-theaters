require 'json'
require 'pry'

movie_data = JSON.parse(File.read('in_theaters.json'))

# list of movies in theatres now FINISHED

# puts "In Theaters Now: "
# movie_data["movies"].each do |x|
#   puts x["title"]
# end

# MPAA rating along w/ each movies FINISHED

# puts "In Theaters Now: "

# movie_data["movies"].each do |x|
#   puts "#{x["title"]} (#{x["mpaa_rating"]}) "
# end


# Average of the critics & audience scores FINISHED

# puts "In Theaters Now: "

# movie_data["movies"].each do |x|
#   puts "#{(x["ratings"]["critics_score"] + x["ratings"]["audience_score"]) / 2 } - \
# #{x["title"]} (#{x["mpaa_rating"]}) "
# end

# Up to the first three cast members FINISHED

puts "In Theaters Now: "

cast_names1 = []
cast_names2 = []
index = 0

movie_data["movies"].each do |x|

  if x["abridged_cast"][1] == nil
    cast_names1 << "none"
  elsif x["abridged_cast"][1] != nil
    cast_names1 << x["abridged_cast"][1]["name"]
  end

  if x["abridged_cast"][2] == nil
    cast_names2 << "none"
  elsif x["abridged_cast"][2] != nil
    cast_names2 << x["abridged_cast"][2]["name"]
  end

  puts "#{(x["ratings"]["critics_score"] + x["ratings"]["audience_score"]) / 2 } - \
#{x["title"]} (#{x["mpaa_rating"]}) starring #{x["abridged_cast"][0]["name"]}, \
#{cast_names1[index]}, #{cast_names2[index]}"

  index += 1
end







# Sorted by highest rating first. ON GOING

# puts "In Theaters Now: "


# def average(a,b)
#   (a + b) / 2
# end
# initial_sort = {}
# casts_names = []
# movie_data["movies"].each do |x|

# # some arrays are outputing nil so have issue

#  puts x["abridged_cast"][1]["name"]


#   # initial_sort[average(x["ratings"]["critics_score"], x["ratings"]["audience_score"])] = [x["title"], x["mpaa_rating"], x["abridged_cast"][0]["name"]]
# #  #{x["title"]} (#{x["mpaa_rating"]}) starring #{x["abridged_cast"][0]["name"]}, \
# #  #{x["abridged_cast"][1]["name"]}, #{x["abridged_cast"][2]["name"]}"
# end

# puts casts_names
# puts initial_sort













