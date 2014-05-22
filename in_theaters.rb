require 'json'
require 'pry'

movie_data = JSON.parse(File.read('in_theaters.json'))

puts "In Theaters Now: "

def average(a,b)
  (a + b) / 2
end

initial_sort = {}
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

  initial_sort[average(x["ratings"]["critics_score"], x["ratings"]["audience_score"])] = [x["title"], x["mpaa_rating"], x["abridged_cast"][0]["name"], cast_names1[index], cast_names2[index]]

end

sorted_movies = initial_sort.sort_by {|k,v| k}.reverse

Hash[sorted_movies].each do |k,v|
  puts "#{k} - #{v.join(", ")}"
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












