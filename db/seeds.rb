# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
20.times do
  Episode.create(title: Faker::Book.title, summary: Faker::Lorem.paragraph, length: rand(1..180), upvotes: rand(1..1000))
end

# Create episode_tags
puts 'create episode tags'
Episode.all.each do |episode|
  EpisodeTag.create(tag_id:rand(Tag.all.first.id...Tag.all.last.id), episode_id: episode.id)
  EpisodeTag.create(tag_id:rand(Tag.all.first.id...Tag.all.last.id), episode_id: episode.id)
  EpisodeTag.create(tag_id:rand(Tag.all.first.id...Tag.all.last.id), episode_id: episode.id)
end

puts 'finished'
