# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
# Destroy all seeds
Episode.destroy_all
Tag.destroy_all
EpisodeTag.destroy_all

# create default tags
puts 'creating array of default tags'
default_tags = ['Sport', 'Science', 'Politics', 'Comedy', 'Lifestyle & Health', 'History', 'Business', 'Technology', 'Society & Culture', 'News', 'Education', 'True Crime', 'Arts & Entertainment', 'Music', 'Kids' ]

puts 'creating default tags'
index = 0
default_tags.length.times do
  Tag.create(tag: default_tags[index], default: true)
  index += 1
end

# create other tags
puts 'creating array of other tags'
tags = ['Funny', 'Inspiring', 'Motivating', 'Quirky', 'Clever', 'Scary', 'Heart warming', 'Mind bending', 'Relatable', 'Interesting', 'Factual' ]

puts 'creating other tags'
index = 0
tags.length.times do
  Tag.create(tag: tags[index], default: false)
  index += 1
end

# Create episodes
sport_url_array = ["https://open.spotify.com/episode/1fOkpcq4Nt6CRjPgZEne4A", "https://open.spotify.com/episode/79g7Vn8Gi9MABPTH1txISF"]
Episode.create(title:  'Tottenham and Gareth Bale shake it up', summary: 'Football Weekly Extra', length: rand(1..180), upvotes: rand(1..1000), url: sport_url_array.first)
Episode.create(title: "The One About Saracens and I'm A Celebrity", summary: "As Hask heads to Australia and 'I'm A Celebrity', Alex and Mike are joined by the former England 7's captain Rob Vickerman to talk all things jungle, the fallout from Saracen's punishment, Emily Scarratt, Sonny Bill Williams, and animal 'bits and pieces'.", length: rand(1..180), upvotes: rand(1..1000), url: sport_url_array.last)

comedy_url_array = ["https://open.spotify.com/episode/6fiqYiBY0gs2VmhKoPbeiX", "https://open.spotify.com/episode/55V89fFqQJzhNvSvvIXcbe"]
Episode.create(title: "Poetry with Peter Dinklage", summary: "Ron and Carolina talk with Game of Thrones’ Peter Dinklage about his favorite poems.", length: rand(1..180), upvotes: rand(1..1000), url: comedy_url_array.first)
Episode.create(title: "S2E2 - 'Amsterdammmm'", summary: "Belinda makes her first trip to Europe to secure a lucrative deal with Peter Rouse. Before she meets him, she encounters some new, interesting characters with their own sexual agendas...", length: rand(1..180), upvotes: rand(1..1000), url: comedy_url_array.last)

# url_array = ['https://open.spotify.com/episode/5UQLUDVEz8PRN1aJlspoQH', 'https://open.spotify.com/episode/79g7Vn8Gi9MABPTH1txISF']
# url_array.each do |url|
#   Episode.create(title: Faker::Book.title, summary: Faker::Lorem.paragraph, length: rand(1..180), upvotes: rand(1..1000), url: url)
# end

# Create episode_tags
puts 'create episode tags'
Episode.all.each do |episode|
  EpisodeTag.create(tag_id:rand(Tag.all.first.id...Tag.all.last.id), episode_id: episode.id)
  EpisodeTag.create(tag_id:rand(Tag.all.first.id...Tag.all.last.id), episode_id: episode.id)
  EpisodeTag.create(tag_id:rand(Tag.all.first.id...Tag.all.last.id), episode_id: episode.id)
end

puts 'finished'

# Commented out until we work out how to implement Spotify / Podcasts API
# require 'rspotify'

# artists = RSpotify::Artist.search('Arctic Monkeys')
# puts artists
