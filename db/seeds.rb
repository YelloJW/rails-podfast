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

# create default tags for non sport and comedy seeds
puts 'creating array of default tags'
default_tags = ['Sport', 'Comedy','Science', 'Politics', 'Lifestyle & Health', 'History', 'Business', 'Technology', 'Society & Culture', 'News', 'Education', 'True Crime', 'Arts & Entertainment', 'Music', 'Kids' ]

puts 'creating default tags'
index = 0
default_tags.length.times do
  Tag.create(tag: default_tags[index], default: true)
  index += 1
end

# create general tags
puts 'creating array of general tags'
general_tags = ['Funny', 'Inspiring', 'Motivating', 'Quirky', 'Clever', 'Scary', 'Heart warming', 'Mind bending', 'Relatable', 'Interesting', 'Factual' ]
general_tags_for_demo = ['Funny', 'Interesting', 'Relatable', 'Factual', 'Quirky']

puts 'creating general tags'
index = 0
general_tags.length.times do
  Tag.create(tag: general_tags[index], default: false)
  index += 1
end

# Create episodes
sport_url_array = ["https://open.spotify.com/episode/1fOkpcq4Nt6CRjPgZEne4A",
                   "https://open.spotify.com/episode/79g7Vn8Gi9MABPTH1txISF",
                   "https://open.spotify.com/episode/2w2hEVEfIfqOJW40HnHDft",
                   "https://open.spotify.com/episode/2WJEDoMEdWUYnQGQcFwRAX",
                   "https://open.spotify.com/episode/17KEDzf5LSuqtH6PXtsBF2",
                   "https://open.spotify.com/episode/5o0itGANMoOv0hE1zaltRO",
                   "https://open.spotify.com/episode/0fWydtTRPulBq1NCv7iuWH",
                   "https://open.spotify.com/episode/7rB3FU9znyBdYnj7lsQK2E",
                   "https://open.spotify.com/episode/4uVzCZtiBlPwSG2NnoJcbb",
                   "https://open.spotify.com/episode/2xMT72VoKJTeCHY6uiN2OF"
                 ]
# Need to add image url to Episode model and then update Episode.create to include img_url
sport_img_url_array = []
Episode.create(title: "Tottenham and Gareth Bale shake it up", summary: "Football Weekly Extra", length: rand(1..180), upvotes: rand(1..1000), url: sport_url_array[0])
Episode.create(title: "The One About Saracens and I'm A Celebrity", summary: "As Hask heads to Australia and 'I'm A Celebrity', Alex and Mike are joined by the former England 7's captain Rob Vickerman to talk all things jungle, the fallout from Saracen's punishment, Emily Scarratt, Sonny Bill Williams, and animal 'bits and pieces'.", length: rand(1..180), upvotes: rand(1..1000), url: sport_url_array[1])
Episode.create(title: "That Crouchfest Episode", summary: "To the astonishment of all involved, the long-awaited and frequently doubted Crouchfest actually comes to fruition, and in ways no-one could ever imagine. Join almost 3,000 happy pod listeners as Crouchy, Tom and Chris put on a show at a sold-out O2 in London that makes the Samrat Christmas special look like a poetry reading in Ealing library. We have Liam Gallagher and a host of superstars from the world of music, a coachload of referees, London’s biggest round of drinks and a man dressed as Tony Pulis. Nothing in the world of That Peter Crouch Podcast will be quite the same ever again.", length: rand(1..180), upvotes: rand(1..1000), url: sport_url_array[2])
Episode.create(title: "That Penalties Episode", summary: "Crouchy tells us what it takes to convert a spot-kick under intense pressure, the time he stole one from Gerrard as well as discussing alternatives to shootouts with Chris and Tom", length: rand(1..180), upvotes: rand(1..1000), url: sport_url_array[3])
Episode.create(title: "Ep. 95 - Chicken Leg, Chicken Wing", summary: "Fresh news from the Gangs of the EPL, a Managers Lunch Club meeting, the Guru gets festive, Andy gets booted into his own car, and we receive two brand new WAVs", length: rand(1..180), upvotes: rand(1..1000), url: sport_url_array[4])
Episode.create(title: "Ep. 91 - Longy Special", summary: "Peter Beardsley returns, Neil Hunt faces a pie-eating adversary, and there’s some singing, some quizzing, and a magical gold card…", length: rand(1..180), upvotes: rand(1..1000), url: sport_url_array[5])
Episode.create(title: "Episode 16 - Foden's X-Factor & Pure Filth", summary: "We're joined by Ben Foden to chat Nicole Scherzinger and Thom Evans and all things X-Factor as well as life in New York and a bit of rugby too. And, we dissect all the Champions Cup action with an open cloth, including some absolute filth of the worst kind at the AJ Bell Stadium and some filth of the best kind from Finn Russell!", length: rand(1..180), upvotes: rand(1..1000), url: sport_url_array[6])
Episode.create(title: "Arsecast Extra Episode 319 - 25.11.2019", summary: "On this week's show we recap the 2-2 draw with Southampton, touching on Unai Emery's tactics, formation changes and substitutions. We wonder why it is we should have been so afraid of a team struggling in the relegation zone, and also why did a last gasp equaliser feel so empty? Emery's future is an ongoing issue, but we turn some focus on the decision makers at the club and ask why are they allowing this to continue? We chat about potential replacements, including Allegri, Arteta, Ljungberg and Vieira, ponder the January transfer window, rate our faith in club officials and lots more in this bumper but quite depressing episode. If you stick with it all the way through, we thank you!", length: rand(1..180), upvotes: rand(1..1000), url: sport_url_array[7])
Episode.create(title: "The Net Session", summary: "It’s our second birthday and to celebrate we headed to The Oval to record the podcast and to have a net session, which seemed like a good idea at the time. Plus Mattchin Tendulkar pitches a new cricketing idea, we look back at England's T20 series versus New Zealand and several cricketing legends are ’thrown under the bus’. Go Well.", length: rand(1..180), upvotes: rand(1..1000), url: sport_url_array[8])
Episode.create(title: "MNC: Should Wilder replace Silva at Everton? And Mourinho’s Champions League return", summary: "Mark Chapman is joined by Chris Sutton, Alan Hutton and Arlo White to discuss whether time is up for Marco Silva at Everton and if Sheffield United’s Chris Wilder could be an ideal replacement. The team reflect on Aston Villa’s 2-0 victory over Newcastle in the Premier League  there are interviews with Villa’s Conor Hourihane and Newcastle’s Steve Bruce on the pod.", length: rand(1..180), upvotes: rand(1..1000), url: sport_url_array[9])


comedy_url_array = ["https://open.spotify.com/episode/6fiqYiBY0gs2VmhKoPbeiX",
                    "https://open.spotify.com/episode/55V89fFqQJzhNvSvvIXcbe",
                    "https://open.spotify.com/episode/4BZV4jezGMsDkjlb94VAeX",
                    "https://open.spotify.com/episode/62UKlDDP2TlaievUl6PExq",
                    "https://open.spotify.com/episode/6E9dSUqQ13coO346bRyzBF",
                    "https://open.spotify.com/episode/5VocP9MqePiTbOQSSbVD8g",
                    "https://open.spotify.com/episode/34tXl36dAWu129sOHeiT7V",
                    "https://open.spotify.com/episode/4OJUx86Deq7l1ebQzLwwVA",
                    "https://open.spotify.com/episode/48eIBqB2dFvTya173c1fRr",
                    "https://open.spotify.com/episode/0JaHrNOs3AnSRvNd98pyQo"
                  ]

comedy_img_url_array = []
Episode.create(title: "Poetry with Peter Dinklage", summary: "Ron and Carolina talk with Game of Thrones’ Peter Dinklage about his favorite poems.", length: rand(1..180), upvotes: rand(1..1000), url: comedy_url_array[0])
Episode.create(title: "EP.111 - NICKY WIRE", summary: "Adam talks with Nicky Wire, lyricist and bass player of The Manic Street Preachers.WARNING: This podcast contains brief references to and a description of self harm.Thanks to Séamus Murphy-Mitchell for production support and to Anneka Myson for additional editing.RELATED LINKSNICKY WIRE’S MOST MEMORABLE QUIPS (NME)MANIC STREET PREACHERS - MOTORCYCLE EMPTINESS (1992)MANIC STREET PREACHERS - THE MASSES AGAINST THE CLASSES (2000)MANIC STREET PREACHERS - TOP TRACKS ON SPOTIFYPOB SPITTING ON THE SCREENNEIL KINNOCK 1985 SPEECH (EDIT)'EVERYBODY IN THE PLACE' JEREMY DELLER RAVE DOCUMENTARY (2018)AN HOUR OR SO WITH SUE PERKINS PODCASTMAX AND IVAN - FUGITIVES", length: rand(1..180), upvotes: rand(1..1000), url: comedy_url_array[1])
Episode.create(title: "Ep 39: Mike Skinner", summary: "There's a table booked for The Streets frontman Mike Skinner this week. Will he pick plenty of scrambled eggs and plenty of fried tomato? Let's ask Carl Jung…Recorded by Ben Williams and edited by Naomi Parnell for Plosive Productions.Artwork by Paul Gilbey (photography and design) and Amy Browne (illustrations).Mike Skinner has new music coming soon. Follow Mike on Twitter: @MikeSkinnerLtd.Follow Off Menu on Twitter and Instagram: @offmenuofficial.And go to our website www.offmenupodcast.co.uk for a list of restaurants recommended on the show.Ed Gamble is on tour, including a date at the Shepherd's Bush Empire. See his website for full details.James Acaster is on tour. See his website for full details.Watch Ed and James's YouTube series 'Just Puddings'. Watch here.", length: rand(1..180), upvotes: rand(1..1000), url: comedy_url_array[2])
Episode.create(title: "Ep 41. Batman lives next door", summary: "On the podcast this week Rosie introduces a new feature as well as still delivering on the weekly beefs! There are some wonderful stories about going commando and getting caught out, sending risque pics and there's a follow up explanation of the word 'bucking'. All of this and a celeb question from Professional Dancer Neil Jones.", length: rand(1..180), upvotes: rand(1..1000), url: comedy_url_array[3])
Episode.create(title: "Ep 40. Cheese table", summary: "It's episode 40 and Chris is off to Blackpool! As well as talking all things Strictly, Rosie and Chris discuss Sandra's latest stash and Rosie's recent trip to London. There are some brilliant stories and questions from the public, topics range from an unfortunate cheese incident to a trip to A&E on a third date. And of course there is a celeb question - this week it's from Strictly alumni Mike Bushell.", length: rand(1..180), upvotes: rand(1..1000), url: comedy_url_array[4])
Episode.create(title: "No Art Just Artists, Fake Quotes, Motivational Speakers, Everybody Flirts, VR - 171", summary: "The 3ShotsOfTequila Podcast - Episode 171 - Topics: No Art Just Artists, Fake Quotes, Motivational Speakers, Everybody Flirts, VR + MoreFOLLOW US ON INSTAGRAM TO KEEP UP-TO-DATE WITH ALL THINGS 3HOTS...Instagram: @3ShotsOfTequila_HOSTS:Marvin AbbeyTwitter: @MarvAbbey Instagram: @MarvinAbbeyEmail: MarvinAbbey@icloud.comKeith DubeTwitter: @MrExposedInstagram: @MrExpsdEmail: hello@keithdube.coTazer BlackTwitter: @TazerBlackInstagram: @TazerBlackEmail: TazerX@mail.comSPECIAL GUEST:Gracious KayWant us to read out your dilemma?Have a question for the team?Wanna get in touch with us?Email: 3ShotsOfTequila@mail.com", length: rand(1..180), upvotes: rand(1..1000), url: comedy_url_array[5])
Episode.create(title: "The Now Show - Series 55 Episode 5", summary: "Download the best satirical comedy from Radio 4, every Friday.", length: rand(1..180), upvotes: rand(1..1000), url: comedy_url_array[6])
Episode.create(title: "#12 - What Really Happened At Zane's Birthday Party", summary: "Zane went missing at his own birthday and was later found with a lot of rumors to clear up! Who needs a shot of espresso when you have and episode this good?", length: rand(1..180), upvotes: rand(1..1000), url: comedy_url_array[6])
Episode.create(title: "Do Fish Drink Water?", summary: "For the first, and probably last time, Emma tries to answer a yes or no question - do fish drink water? After that, she gets into Thanksgiving dinners and how to prevent your family from arguing at the dinner table.", length: rand(1..180), upvotes: rand(1..1000), url: comedy_url_array[8])
Episode.create(title: "404 - Jan Pieterszoon Coen (live)", summary: "Comedians Dave Anthony and Gareth Reynolds examine Jan Pieterszoon Coen of the Dutch East India Company. Recorded live in Amsterdam.Tour DatesSourcesRedbubble Merch", length: rand(1..180), upvotes: rand(1..1000), url: comedy_url_array[9])

# url_array = ['https://open.spotify.com/episode/5UQLUDVEz8PRN1aJlspoQH', 'https://open.spotify.com/episode/79g7Vn8Gi9MABPTH1txISF']
# url_array.each do |url|
#   Episode.create(title: Faker::Book.title, summary: Faker::Lorem.paragraph, length: rand(1..180), upvotes: rand(1..1000), url: url)
# end

# create first X sport seeds and last X comedy seeds
puts 'create episode tags'
Episode.first(10).each do |episode|
  EpisodeTag.create(tag_id:Tag.where('tag = ?', 'Sport').take.id, episode_id: episode.id)
  rand(1..4).times do
  EpisodeTag.create(tag_id:Tag.where('tag = ?', general_tags_for_demo.sample).take.id, episode_id: episode.id)
  end
end

puts 'create episode tags'
Episode.last(10).each do |episode|
  EpisodeTag.create(tag_id:Tag.where('tag = ?', 'Comedy').take.id, episode_id: episode.id)
  rand(1..4).times do
  EpisodeTag.create(tag_id:Tag.where('tag = ?', general_tags_for_demo.sample).take.id, episode_id: episode.id)
  end
end

puts 'finished'

# Commented out until we work out how to implement Spotify / Podcasts API
# require 'rspotify'

# artists = RSpotify::Artist.search('Arctic Monkeys')
# puts artists
