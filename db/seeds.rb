# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
require 'faker'
# Destroy all seeds
Episode.destroy_all
User.destroy_all
Tag.destroy_all
EpisodeTag.destroy_all
Playlist.destroy_all
PlaylistEpisode.destroy_all

# create default tags for non sport and comedy seeds
puts 'creating array of default tags'
default_tags = ['Comedy', 'Sport', 'Lifestyle', 'Technology', 'Science', 'Politics', 'History', 'Business', 'Culture', 'News', 'Crime', 'Arts' ]
default_tag_img = ["https://png.pngtree.com/element_pic/00/16/08/2057b74ff0ceec8.jpg",
                   "https://cdn2.vectorstock.com/i/1000x1000/48/81/comedy-concept-word-art-vector-21504881.jpg",
                   "https://cdn4.vectorstock.com/i/1000x1000/99/83/word-design-for-science-vector-19019983.jpg",
                   "https://insidewestminster.co.uk/wp-content/uploads/2017/11/f87de1210cfa5bd7ca3b1fd2648f6e73.png",
                   "https://static.vecteezy.com/system/resources/previews/000/288/471/non_2x/healthy-lifestyle-vector-illustration.jpg",
                   "https://logos.flamingtext.com/Word-Logos/history-design-sketch-name.png",
                   "",
                   "",
                   "",
                   "",
                   "",
                   "",
                   "",
                   "",
                   "",
                  ]

puts 'creating default tags'
index = 0
default_tags.length.times do
  Tag.create(tag_img: default_tag_img[index], tag: default_tags[index], default: true)
  index += 1
end

# create general tags
puts 'creating array of general tags'
general_tags = ['Upbeat', 'Inspiring', 'Fun', 'Factual', 'Motivating', 'Quirky', 'Clever', 'Moving', 'Scary', 'Mind bending', 'Relatable', 'Interesting', 'Factual' ]
general_tags_for_demo = ['Fun', 'Factual', 'Upbeat', 'Quirky', 'Moving', 'Inspiring']

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
sport_img_url_array = ["https://uploads.guim.co.uk/2018/08/06/football-weekly-3000_(1).jpg",
                       "https://is2-ssl.mzstatic.com/image/thumb/Podcasts123/v4/fc/1d/e1/fc1de1f6-d797-e791-7a00-3ee2028d2db0/mza_13898134202945124367.jpg/600x600bb.jpg",
                       "https://pbcdn1.podbean.com/imglogo/dir-logo/478868/478868.jpg",
                       "https://pbcdn1.podbean.com/imglogo/dir-logo/478868/478868.jpg",
                       "https://thumborcdn.acast.com/46gcVg9exHSnTdmTYla0qTxVcKM=/3000x3000/https://mediacdn.acast.com/assets/a3289f5e-b832-4883-8634-f8e1b63d2506/cover-image-k262ujt2-crest_1500x1500.png",
                       "https://www.eastlondonadvertiser.co.uk/polopoly_fs/1.5861032.1548409492!/image/image.jpg_gen/derivatives/landscape_1024/image.jpg",
                       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGOE5jg72TStx6gV3RUFJFw0qK6da19WFatRcXq4eQDeS1xpo6&s",
                       "https://thumborcdn.acast.com/Nv3PWGebkJL2UURVpW51oKEgI4o=/3000x3000/https://mediacdn.acast.com/assets/3b2129bd-f56c-457f-861c-8faa9d716941/cover-image-k3ed8299-319_1400.jpg",
                       "https://ichef.bbci.co.uk/images/ic/1200x675/p073xbn5.jpg",
                       "http://ichef.bbci.co.uk/images/ic/3000x3000/p06g7bs3.jpg",
                        ]

Episode.create(listens: rand(1..2000), img_url: sport_img_url_array[0],title: "Tottenham and Gareth Bale shake it up", summary: "Football Weekly Extra", length: rand(1..180), upvotes: rand(1..1000), url: sport_url_array[0])
Episode.create(listens: rand(1..2000), img_url: sport_img_url_array[1],title: "The One About Saracens and I'm A Celebrity", summary: "As Hask heads to Australia and 'I'm A Celebrity', Alex and Mike are joined by the former England 7's captain Rob Vickerman to talk all things jungle, the fallout from Saracen's punishment, Emily Scarratt, Sonny Bill Williams, and animal 'bits and pieces'.", length: rand(1..180), upvotes: rand(1..1000), url: sport_url_array[1])
Episode.create(listens: rand(1..2000), img_url: sport_img_url_array[2],title: "That Crouchfest Episode", summary: "To the astonishment of all involved, the long-awaited and frequently doubted Crouchfest actually comes to fruition, and in ways no-one could ever imagine. Join almost 3,000 happy pod listeners as Crouchy, Tom and Chris put on a show at a sold-out O2 in London that makes the Samrat Christmas special look like a poetry reading in Ealing library. We have Liam Gallagher and a host of superstars from the world of music, a coachload of referees, London’s biggest round of drinks and a man dressed as Tony Pulis. Nothing in the world of That Peter Crouch Podcast will be quite the same ever again.", length: rand(1..180), upvotes: rand(1..1000), url: sport_url_array[2])
Episode.create(listens: rand(1..2000), img_url: sport_img_url_array[3],title: "That Penalties Episode", summary: "Crouchy tells us what it takes to convert a spot-kick under intense pressure, the time he stole one from Gerrard as well as discussing alternatives to shootouts with Chris and Tom", length: rand(1..180), upvotes: rand(1..1000), url: sport_url_array[3])
Episode.create(listens: rand(1..2000), img_url: sport_img_url_array[4],title: "Chicken Leg, Chicken Wing", summary: "Fresh news from the Gangs of the EPL, a Managers Lunch Club meeting, the Guru gets festive, Andy gets booted into his own car, and we receive two brand new WAVs", length: rand(1..180), upvotes: rand(1..1000), url: sport_url_array[4])
Episode.create(listens: rand(1..2000), img_url: sport_img_url_array[5],title: "Longy Special", summary: "Peter Beardsley returns, Neil Hunt faces a pie-eating adversary, and there’s some singing, some quizzing, and a magical gold card…", length: rand(1..180), upvotes: rand(1..1000), url: sport_url_array[5])
Episode.create(listens: rand(1..2000), img_url: sport_img_url_array[6],title: "Foden's X-Factor & Pure Filth", summary: "We're joined by Ben Foden to chat Nicole Scherzinger and Thom Evans and all things X-Factor as well as life in New York and a bit of rugby too. And, we dissect all the Champions Cup action with an open cloth, including some absolute filth of the worst kind at the AJ Bell Stadium and some filth of the best kind from Finn Russell!", length: rand(1..180), upvotes: rand(1..1000), url: sport_url_array[6])
Episode.create(listens: rand(1..2000), img_url: sport_img_url_array[7],title: "Arsecast Extra Episode", summary: "On this week's show we recap the 2-2 draw with Southampton, touching on Unai Emery's tactics, formation changes and substitutions. We wonder why it is we should have been so afraid of a team struggling in the relegation zone, and also why did a last gasp equaliser feel so empty? Emery's future is an ongoing issue, but we turn some focus on the decision makers at the club and ask why are they allowing this to continue? We chat about potential replacements, including Allegri, Arteta, Ljungberg and Vieira, ponder the January transfer window, rate our faith in club officials and lots more in this bumper but quite depressing episode. If you stick with it all the way through, we thank you!", length: rand(1..180), upvotes: rand(1..1000), url: sport_url_array[7])
Episode.create(listens: rand(1..2000), img_url: sport_img_url_array[8],title: "The Net Session", summary: "It’s our second birthday and to celebrate we headed to The Oval to record the podcast and to have a net session, which seemed like a good idea at the time. Plus Mattchin Tendulkar pitches a new cricketing idea, we look back at England's T20 series versus New Zealand and several cricketing legends are ’thrown under the bus’. Go Well.", length: rand(1..180), upvotes: rand(1..1000), url: sport_url_array[8])
Episode.create(listens: rand(1..2000), img_url: sport_img_url_array[9],title: "Should Wilder replace Silva at Everton?", summary: "Mark Chapman is joined by Chris Sutton, Alan Hutton and Arlo White to discuss whether time is up for Marco Silva at Everton and if Sheffield United’s Chris Wilder could be an ideal replacement. The team reflect on Aston Villa’s 2-0 victory over Newcastle in the Premier League  there are interviews with Villa’s Conor Hourihane and Newcastle’s Steve Bruce on the pod.", length: rand(1..180), upvotes: rand(1..1000), url: sport_url_array[9])


comedy_url_array = ["https://open.spotify.com/episode/6fiqYiBY0gs2VmhKoPbeiX",
                    "https://open.spotify.com/episode/4BZV4jezGMsDkjlb94VAeX",
                    "https://open.spotify.com/episode/62UKlDDP2TlaievUl6PExq",
                    "https://open.spotify.com/episode/55V89fFqQJzhNvSvvIXcbe",
                    "https://open.spotify.com/episode/6E9dSUqQ13coO346bRyzBF",
                    "https://open.spotify.com/episode/5VocP9MqePiTbOQSSbVD8g",
                    "https://open.spotify.com/episode/34tXl36dAWu129sOHeiT7V",
                    "https://open.spotify.com/episode/4OJUx86Deq7l1ebQzLwwVA",
                    "https://open.spotify.com/episode/48eIBqB2dFvTya173c1fRr",
                    "https://open.spotify.com/episode/0JaHrNOs3AnSRvNd98pyQo"
                  ]

comedy_img_url_array = ["https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fblogs-images.forbes.com%2Fjoshuadudley%2Ffiles%2F2019%2F02%2FRonBurgundyLogo-FINAL-B-3000x3000-1200x1200.jpg",
                        "https://cdn1.player.fm/images/746416/series/n8vkziT8DKVYLRe3/512.jpg",
                        "https://thumborcdn.acast.com/7kTakLlg7W4qF4AO3CpgLVjr7UA=/3000x3000/https://mediacdn.acast.com/assets/64d76190-b009-4f76-93df-9d980cbe281d/cover-image-k1rqhp83-off-menu-podcast-final-web.jpg",
                        "https://upload.wikimedia.org/wikipedia/en/f/f8/My_Dad_Wrote_a_Porno_logo.jpg",
                        "https://i1.sndcdn.com/avatars-000578286531-oewsyb-t500x500.jpg",
                        "http://assets1.livebrum.com/images/glee-club/ewox/home/3-shots-of-tequila-podcast-1557771534.jpg",
                        "http://db.radioline.fr/pictures/podcast_9e23341b9a3cb5ffca548f25121228f3/logo200.jpg",
                        "https://i.scdn.co/image/500b3e4d1a692561c3ff240345bf18eef1763a56",
                        "https://bloximages.newyork1.vip.townnews.com/insideradio.com/content/tncms/assets/v3/editorial/e/f1/ef1fe13c-57c2-11e9-b340-93aa9556a74c/5ca78768bae0d.image.jpg",
                        "https://allthingscomedy.com/images/_larger/DOLLOP_cover2.jpg",
                        ]

Episode.create(listens: rand(1..2000), img_url: comedy_img_url_array[0], title: "Poetry with Peter Dinklage", summary: "Ron and Carolina talk with Game of Thrones’ Peter Dinklage about his favorite poems.", length: rand(1..180), upvotes: rand(1..1000), url: comedy_url_array[0])
Episode.create(listens: rand(1..2000), img_url: comedy_img_url_array[1], title: "NICKY WIRE", summary: "Adam talks with Nicky Wire, lyricist and bass player of The Manic Street Preachers.WARNING: This podcast contains brief references to and a description of self harm.Thanks to Séamus Murphy-Mitchell for production support and to Anneka Myson for additional editing.RELATED LINKSNICKY WIRE’S MOST MEMORABLE QUIPS (NME)MANIC STREET PREACHERS - MOTORCYCLE EMPTINESS (1992)MANIC STREET PREACHERS - THE MASSES AGAINST THE CLASSES (2000)MANIC STREET PREACHERS - TOP TRACKS ON SPOTIFYPOB SPITTING ON THE SCREENNEIL KINNOCK 1985 SPEECH (EDIT)'EVERYBODY IN THE PLACE' JEREMY DELLER RAVE DOCUMENTARY (2018)AN HOUR OR SO WITH SUE PERKINS PODCASTMAX AND IVAN - FUGITIVES", length: rand(1..180), upvotes: rand(1..1000), url: comedy_url_array[1])
Episode.create(listens: rand(1..2000), img_url: comedy_img_url_array[2], title: "Mike Skinner", summary: "There's a table booked for The Streets frontman Mike Skinner this week. Will he pick plenty of scrambled eggs and plenty of fried tomato? Let's ask Carl Jung…Recorded by Ben Williams and edited by Naomi Parnell for Plosive Productions.Artwork by Paul Gilbey (photography and design) and Amy Browne (illustrations).Mike Skinner has new music coming soon. Follow Mike on Twitter: @MikeSkinnerLtd.Follow Off Menu on Twitter and Instagram: @offmenuofficial.And go to our website www.offmenupodcast.co.uk for a list of restaurants recommended on the show.Ed Gamble is on tour, including a date at the Shepherd's Bush Empire. See his website for full details.James Acaster is on tour. See his website for full details.Watch Ed and James's YouTube series 'Just Puddings'. Watch here.", length: rand(1..180), upvotes: rand(1..1000), url: comedy_url_array[2])
Episode.create(listens: rand(1..2000), img_url: comedy_img_url_array[3], title: "Amsterdammmm", summary: "Belinda makes her first trip to Europe to secure a lucrative deal with Peter Rouse. Before she meets him, she encounters some new, interesting characters with their own sexual agendas...", length: rand(1..180), upvotes: rand(1..1000), url: comedy_url_array[3])
Episode.create(listens: rand(1..2000), img_url: comedy_img_url_array[4], title: "Cheese table", summary: "It's episode 40 and Chris is off to Blackpool! As well as talking all things Strictly, Rosie and Chris discuss Sandra's latest stash and Rosie's recent trip to London. There are some brilliant stories and questions from the public, topics range from an unfortunate cheese incident to a trip to A&E on a third date. And of course there is a celeb question - this week it's from Strictly alumni Mike Bushell.", length: rand(1..180), upvotes: rand(1..1000), url: comedy_url_array[4])
Episode.create(listens: rand(1..2000), img_url: comedy_img_url_array[5], title: "No Art Just Artists, Fake Quotes", summary: "The 3ShotsOfTequila Podcast - Episode 171 - Topics: No Art Just Artists, Fake Quotes, Motivational Speakers, Everybody Flirts, VR + MoreFOLLOW US ON INSTAGRAM TO KEEP UP-TO-DATE WITH ALL THINGS 3HOTS...Instagram: @3ShotsOfTequila_HOSTS:Marvin AbbeyTwitter: @MarvAbbey Instagram: @MarvinAbbeyEmail: MarvinAbbey@icloud.comKeith DubeTwitter: @MrExposedInstagram: @MrExpsdEmail: hello@keithdube.coTazer BlackTwitter: @TazerBlackInstagram: @TazerBlackEmail: TazerX@mail.comSPECIAL GUEST:Gracious KayWant us to read out your dilemma?Have a question for the team?Wanna get in touch with us?Email: 3ShotsOfTequila@mail.com", length: rand(1..180), upvotes: rand(1..1000), url: comedy_url_array[5])
Episode.create(listens: rand(1..2000), img_url: comedy_img_url_array[6], title: "The Now Show", summary: "Download the best satirical comedy from Radio 4, every Friday.", length: rand(1..180), upvotes: rand(1..1000), url: comedy_url_array[6])
Episode.create(listens: rand(1..2000), img_url: comedy_img_url_array[7], title: "What Really Happened At Zane's Birthday Party", summary: "Zane went missing at his own birthday and was later found with a lot of rumors to clear up! Who needs a shot of espresso when you have and episode this good?", length: rand(1..180), upvotes: rand(1..1000), url: comedy_url_array[7])
Episode.create(listens: 1785, img_url: comedy_img_url_array[8], title: "Do Fish Drink Water?", summary: "For the first, and probably last time, Emma tries to answer a yes or no question - do fish drink water? After that, she gets into Thanksgiving dinners and how to prevent your family from arguing at the dinner table.", length: rand(1..180), upvotes: 877, url: comedy_url_array[8])
Episode.create(listens: rand(1..2000), img_url: comedy_img_url_array[9], title: "Jan Pieterszoon Coen", summary: "Comedians Dave Anthony and Gareth Reynolds examine Jan Pieterszoon Coen of the Dutch East India Company. Recorded live in Amsterdam.Tour DatesSourcesRedbubble Merch", length: rand(1..180), upvotes: rand(1..1000), url: comedy_url_array[9])



# creating other seeds

comedy_sports_url = "https://open.spotify.com/episode/0yC2A4U5VQy2GuGDiQi1UV"
comedy_sports_img_url = "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxAPDxUQDw8QDw8QFQ8QDxUVFQ8QFRUWFRUWFxUVFRUYHSggGBolGxUVITEhJSktLi4uGB8zODMtNygtLisBCgoKDg0OFRAPFy0dHR8tLS0rLS0tLS0tLS0tLS0rLS0tLS0tLS0tLSstLS0tLS0tKysrKy0rLS0tKy0tLS0tK//AABEIAOEA4QMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAACAwABBQYHBAj/xABDEAABBAEDAgMGAgcECAcAAAABAAIDEQQFEiEGMRNBUQciMmFxkRSBI0JSobHB0RVic4IzNVVyk+Hw8RYkNkOSwsT/xAAZAQEBAQEBAQAAAAAAAAAAAAAAAQIDBAX/xAAgEQEBAAIDAQACAwAAAAAAAAAAAQIREiExA1FxBEFh/9oADAMBAAIRAxEAPwDiuPA+R4jjY6SR5DWNaC5ziewAHcrKHpTUf9n5n/Am/on9Af61xP8AHj/iupdaajHHkzj/AMQTYkjWgjGbGXNafCBDd397g/5lVcWwMCbIdsx4ZZ3gFxbGx0jg0UCSGjtZHPzCCXGkZIYnxvbK12wsIIcHXW0t738l1X2XYU2JpeRqMOO/IyZi2LGjaNxc1jgHH6bi6/8ADXi9q2keFquPltaWx5hhcbsESRua1wI8jtMZ+toOe6jpWTjUMnHmx997PEjfHuqrrcBdWPuE8dPZvieF+CyvFLPFDPCl37L279tXtsgWu6da48OqOn0p21uVHEzLw3Hi3e8CL8hYAPyffktO9r+rZGHqMMmNM+CQ4gjc5pAO3xXEt+ltH2QaF/4T1L/Z2b/wJv6LwYOnzTv8OCGWaQAuLY2Oe4AGiSALAsj7rrPtD6izMfT9NlgyZY5J4t0zmkW8+FEbd+ZJ/Nef2XYc2LpuVqMUD8jJmIixmAbi4NdTjx5b3G/8NByrIx3xPdHIx0cjCQ9rgWuaR5EHkLJYvTGfLH4seDkvjItrhFIQ4erePeH0W7+1jTWY+pY+e6EvhyfBfNGRy50RZvYQeAXR7RXqCtszMmHVpWS6br0mLNtAZAHANJFk3AS0uNd/iHCDih0XL8N8v4XI8KIubK/w5NrC3uHmvdIsd/VBjaXkSxuljx5pIY78SRrHuYyhZ3OAoUOeV0bpvW58TWcjB1MslbnPEOSALjMj2gMeG+TXtcAeB8Qvsh9pWVFpuJFouHuDP9PlOPxODnEta4+dkWfk1oQcwUUUVVFFFEEUUpRBFStRBSitRBSitRQUorVIIooogiiiiD36FqRxMqLJDA8wPbIGk7Q6vK/JO6p1o6hmSZboxEZfDtoJcBtY1nc1+zaVoOm/i8qHGD/D8d7Y91btt+dWL+63PUPZ5h473RTa5jRysrcx0W1wsBwseJ5gj7ojE5/XmS7Ex8TF34LMVu0uileHSGqtxFVzuNervkrzuuZcjChxciLxpMaVszJ3SOMji1xNOBHPuu23fkCj6c6GORiHOy8uPAw7pj3t8Rz6NEhtihYIHmSDwh6n6IdiYzc3Hyo87CeQ3xWDYWkmhubZ4vi74PBAQK1zrabJ1KPUY42wTQiMNaHF4O0usE0OCHEEeiR1v1S7VZ2TOhbAY4/CADi+/ec67IH7Sy+D7PmtxY8nUdQi05s9GFjmGR5BFguG4VwQa5oEXSRq/QhxMiBs2XEMLKvw8sC4wNu73m7uCeK96iD34KDw9TdWOz8bFx3QtiGEzYHBxcX+4xlkECvgv816c3rrJOHj4eLuwmYwpzopHh0pqrcRVWS5xHPLvks4fZnjfh/xX9tQfhidvi+D7l3trd4vrwvFo3s/iym5MjdTibj4b9hmERex7dgeX8P4AuvPsg8kvX88mJjwTRCebEmjyYp5Hvc4uY8uaHj9YUdvfsB6LIM9o0DH+PHouEzLFkSg1TiOXbQ0Hz9b+ax/U3Q5xMRmbBmRZuK9wYXsaWUSSAQNxBFtIPNg+Xo7of2fSapC+f8AEDHY1/hMuMybyGhzv1hQFj18/RBrrtblfnDOmqSYTR5Dv1QSxwIaK7CmgfIL0dYdQu1PKOS6IQksZHtDi8e7fNkD1Q6JoD8jUG4D3eDIZJYXurftdGHbuLF8sI7pXUmkHCy5cUyeL4Lg3ft2braHfDZrv6oMXSlLZ9a6SOLp2Nn+OHjLLQI9hbs3Mc74tx3fDXYLWqVA0pSKlKQDSlIlVIBURUogFUipRFCorpRBSitUgiiiiClaiiDP9A/61xP8eL+K3b2idVww52RjO0rBneGsb48kbTKd8LSHbtvdu6h/uhcugldG4PY5zHtNtc0lrgfUEcgosnIkleZJZHyyOrc57nPcaFC3Hk8ABRHVM7Ck1XpzEZgjxZMR8YniaRuBYx7Dx6+8HAeYcgyMN+m9MTY+aNs+XKTDE4guFviPYE9hG5/ysdiuZ4OfPjuLoJpYHHgmN74yR6EtItTMzZp3b55pJn1W6R75DXpbieEHVfaRpU+rQYWXp7Dkw+G9pawtJaXbDyL8iC0+hbyvF7RW/hNFwNPmcDlscyV7QQ4ta1kgN15AyBo9dprsud4OqZOOCMfJngDuXCOSSME+pDSLKTPM+RxfI98j3fE55L3H6uPJTQ6RJ/6Qb/j/AP6XL2+yUO/srO2QtyX7jticLbIfCFMcPQ9ly/8AGzeF4PjS+Bd+Hvf4d3d7L23fPZHhalkQAiDInha424RySRgn1IaRZTSOq9YYjpdB3ZeK3TZceUfhceJw8Nxc4ADwm8Wd0nzHJ8ysi9mNpeNgYk2ox4MuM6PLmaWPlMxO8SNNEbWlzpBfPYccLjOTqE8rmulnmlcw2wvkkeWn1aSeD9EOXlSzO3zSyTPoN3SPfI6hdC3EmuT900Or6ppQh6nxMiP/AEWbumaR2L2xOa+vqCx3+ZYDr/o/UJtRyciLEe+Bzg9rwYgC1sbbNF1+RWm/2nk+5/5nI/Q8Q/pZf0fG39Hz7nHHFcJztdzSCDm5ZBBBBnnIIPcH3k0Oja5ouTm9P6czFhdM9gie4AtFN8J4v3iPMhcx1XSp8SXwcmJ0MtNftJaTRuj7pI8inQazlxtDI8vKYxoprWzTNa0egAdQC82VkyTO3zSySvoDc9z5HUOwtxJpUebaptTKVUgXtULUylKQLpVSZSqkC1VJlKiEAUqpHSpF2FVSKlVIqlStRBStRRBm+i8dkupYscjGyRvmja9rgHNcCeQQe4XQ9S9nk7tabNFhwjTBLjOc0GBrNjWs8X9Fd1YdxXK5z0nmR4+fjzzO2xRSsfIac6mjuaHJ/JbHqvU0MmvtzI55DhCbEeTUoG1jIw/9GRfdp4rlRC+rtBbL1A/Bxo2wskkxWNbG1rWsa6CJ0jg0cCgXu+6232gdP4MmBkOwMeKKbTZWNm8NjGFzdjC8EjkgCQGz5xuWPwuqNNbrmXqUkzjH4UTcP9FNb3+DGx5+G21sLea+NH057R8Z8ksedh4uJBksk8d8Mby6R7u/iBoJdYc/k3yfmiPR7NtG0+bSS/MghcZMiTHErmt3gybGMDZKtp3O4PkSvG/pJmHpOptyIY35GPKPAmLG7vDIhLHMcRYBBN12O4LEM1rFj0KfAZO505yd8PuSt3RiWMh+6qaS1hNEgrOZ3X0GXocmNkPcM90YiI2SESFr2kP3AbRYFmyOb+SAYNLxNK07Gmfgs1HUNQ2GJkg8RrS5ocGtbRHAc0cCyT3rtiuo8Y5TceN2j/2VkzZMUHiNjMcTxJbaqh7wcQa54B5Xv07qbBzMHHxs+abCycEsONkRtc/4BTXe6CQaAsHzAIKnWvVmPJjYkOLlSZeRhzRTmaSORgcY2upzt9EkuI7fdB6ep83T9FmZhRaVjZYbGx+RJMGvkcHE8BxaeeL9BYACPVtDwcHVsKUQRvwNQDmOikaJGRudtDXNDr2i3xn5e95HhGtahourPZlZWTkYU4Y1k8QjfJuDSTTXtaR5mj3qrAKwftB6mZqM0Yx2ujxsZhjgv3XEmrfX6oprAB34vzoXQz+m9FRjqGWGSJpw4Q/LDXAGMskFMjI7bQ9zhXpGvV0Nh4mc7Up2afizBr2nCidHE1lBsgjaLFM3bWkn1JKvVvaBiyaY/Y4jU58eLGmpkra7h5ElVQ8SVw57uWF9n2uYeNjZcGXM+D8U1rGFjJXkDZI1xGxpojcKtNBnWmDJG3HE2jYenB+RGA+F8L3P4NxuDB8JBvn9kLctS0jHZqMWLHoONLiyNa6XIETGiMlzwRe2uA1pq795c31iLTYxE/Ez8rKe2aMvbMyRrWxiy5wJYLNhor5lbZqntHY3VGS48r5tPMTIp4y2RgDi95dI1jwPeALOfMAj6NDROtMGDH1GeHF/0Eb2hgvcGksaXtB8wHlw/KvJYTas71VHhDJc7T5N+PJ74aWSxmInuwB4Ft8xXka8ucPtV0hVKbU3aq2poKpVSbtVEJo2SQqpNpUQilEIaTSEJCgXSpGQhIQCqRKkVSpEoirCIBQBGAjKgEQCgCMBBQCIBQBGAqBARAIg1EAiBARBqIBEAqgA1XtTKU2oA2q9qZtUAVC9qm1HtV7UCqVbU3aqpQKLUJCdtQkIElqEhOLUJCKSQhITS1CQoFEISEwhCQopZCEphCEoBVK6URTAiAUCMBEQBEAoAjAVRAEQCsBGAiBARgKwEYCoEBGGqwEQCqBDUW1bBpfR+ZkReKxjWMq2l52bvpx+80sxp3s6yJBukmjY3+6HPJ+l0puRdWtI2qbV0qT2YCuMl+75saR9rXlg9mM7nc5EYZ67HX/8b/mpzi8a5/tULF0Kf2XZDR7mRE8+QLXs/eLWIy+g9RjF/h/Eb6xuY/8Ad3/cryiarUtqohbBqXS+VjxCWWPaD3bdub/vAdlgy1VCiEJCbSotQJpCWpxCAhRSSEBCc5qAhAkhCQmuCBwUUohAQmlAVFBSiKlEDAEQCoIwEFgJjQqARgKosBGAoAjAViIAjAVAIwFUUAtq6E6eGXMXvvwoac7tyfJtFa3jQOkcGMaXOdwAOV07S4XabpEj2e/PM8BtU3kkMHJPkbWM8tRrHHdZrLyjNK3GjFRx14tcAkdm/QeYHyW14MDWtAsfJcbyeqsuCSFk2nujJosLXNdZ8+RweKXSOn9UM0bXuDmWOA7gn8lwuevXbg2R8YXmy8pkYsnjsvK3P3NceTt3AfOuP5LSOsupYodttfJyC1rR8XH8FOe/F4flvzMkPFt5HknQOXN9B9pGIQBIH4554LTX0+3p6LfdK1SDJjD4JGyMPLXNNg/mtSpYHVsNrwWkAtlDgb9a4XFOoen3Qjx4wXwu+Kv1D6H5LuWY3c3/AHXA/wBVpkAaGyAgGMvkaQexaXGlLnwy/wAWYco4+QpSz/U3T7sV3iM97HefcP7JP6rv5FYKl6ZZZuPPZZ1Sy1AQnUgIVQlwS3BPIS3BRSSEtycQgcEUkhAU1wSysqBRFSpA0BGAhATAiCATGhC0JjQqi2hMAVNCMBVEARUoEbDRB9CFRvWnaa3Ahe806ZzGc+hcLofLkJ/WGUf7Gg20bEMn+YEPP77Wvazr7qI2/o5gzwvOiAGlvP8A1yvZ1fMMbEggc7cWRzSUf77yGD7WvLN27r0XqSRsEWs4k2LEx0kLZJAC3xHNBbYovIPN8mvushpmRjiQQxZkEsnmA8OPb0B/gubaDrUbQ9jmRO2FlOvduae3J8+Ec2ZjZoc4QHGdHzy4Dtzbf1mu5XOzvt2k66rsBcWED+lUsfP03BkPqRjS0OLhd+fr9CvN03I+TBifI4vf4bNxuySGiz+9ZXA1MEUPi7LneslncOh0jGhYf0MQAvu1v2QaRifpCY2sjjs/A3Zu+vqfmvbkQeNQJIbfI9fRZSNjWMDRxXC9GMccqRkN2su+AST9A0n+i1OVhZBuDeXBzgO/dbbmDcwt9Q7+IH81iNSYNgaPSlz+sa+da65rZofDeA5rm7ZB2vjyPr8/ktE6g6bfi++0mSBxoO7Ob8nj+fb6LoWPi7Hc+f0+6d1JitZp87pK27CBf7R+ED52s/x88pdN/bHGzbjRCEhNIQOC+g8JLggcE4hLcEUhyAprgluCgU4Jbk1yW5RQUorUUUxoTGoGpgVQbUxqAJjUiDCIIQrtVBgoglgq9yo9+nYjsmWKC/ddI0i+w5BcflwCshrZGo5slECNlsaDxTI/d/Ls77rEYmZJC7fFw+nNDv2bFWPmjxNVbiybnbnNLC0gHuXXZPIs2T91yyne3TG9aYHIe9j3N77S0A1VhnY/Sh+9ZXTpRmSsZLFGC3uWtG5444cfOg0Dj5+qUJJHO8XHiDgAW+9RFEEH3fzTNKijErS64SaO14IHINhp8/p6JqNcr47do2MGwhjWuFAt7ADzHbtXH7wvJi4xjyNjr77gewr/AKJXr0GUOYKJeaDjTzdGyDRo82fsvVDiHxTI8W952ht7trRZ7+q8+WG66zPUen8a1p7elL3OmJC802I3duPlVfuTX8mgOy6+Rz3t5MjUKyRDx70Mjh/lfGP/ALLFdSZTgGbB7ziRSwnWmojEzcaZ7z4Yc6OU8cMeKcfXjh3HoldZ6jLE1jmtBDm1G/uLNHcPXgcfVccpcrp1xsk2ysGRDjjxMyRrD3a2/ePbsB3WodYdVuziI2Asx2G2t83H1K1uSRzzue4uce5PKEr0/P5TBwz+tyLIQFMIQFdXIpwQOTXJTkUpyW5NclFQKcluTXJblFAorUUUxqY1LamNRBhGEARAqoO1doLUtNgy5VuQbkJcge16k0DZI3X3aLb9bpI3L1YbgQ9p82mvql8WevJgcXdUCCearyNfdZF/gzN2VueOztwu74/itc3Fr787o/wKybtPcW7mg9rv+i4Xf5dpYzuh65kaeaO57LJAab7igAt40bW87Nla5ojxoG+9KX7nPr5eQ7DklcqhwMi/cLr8it56GxcieYx5Esm2LwyGCgDY4J9e33Ck2vTo2Njz5ExlLyyMGmN9W+RP/Xos6MOhy7+SbhRhrAPRMldx2WtMbcu9pulPyHxMZtLQ4B3r/wA16taxYMbTmxzgmqEbQaINfq+gW35uKwESSdm29xryH8fJcr6/1HxskCiA1o4PlfNK4ztMr011QqgrXdyAUBTCgcgW5KcmuSnoFOS3JjkpyiluS3JjktyigpWqUUU1qMJbSjBRB2iBSwVdqoO1RKG1RKKvchLkJKAlAzcspiY2xniOrniue317LwaTD4s7GftOC3/qTAAgprRYAPA59fPlQaPqOm+HKOLY+nNP8lvXT+C2SIuLeA2q9VqLdSE7RC+mSxmmWPiPpwOFndJ110Q2mKUgcOppLb+oXKusbXhaLH+qBXkV7cKD8LmAkCpI9oPps5A+xP2R6U5zmgsJdfkAeP3IdYimoOMbztIPHpyDXz5RW5Y2UCLsUniXd2FrQcDOkIqN7SR8TTYcPQ13r5LYtOkm8yK8zwE2lj16/K1kRDjye58hz/2Wp9Z9LCfH8aIfpohdftN82/XzH2817Nez2zZUODGS6V0kUkvF1FGd7iT252gf5ltssI2EEfI/mtY1Mseo+dwovXrGGcfIkid3Y97R8xfB+1Lxkrs4paAq0LkAOKW4o3JbkUtyU5MclErIByU5McUtyihtRUoimAogUsFECgMFXaC1LRBWqJVEoSUVCUBKslAUD8LIfHIHsNOB4Pfvwuq6bhukxtx3nc3ndvrt5Arl+i1+IZfNHhd10kB8QAbtFC7G39yhXNte6Wcd0kY9/wCJtfTj8v6rZukNaikxiCWidvE8bhtpwHLmjzH0Wf1HFDGsdXDnMZ8veO1al1/0c0AT47aePjqxbaIvjzullvFsWhdR73GJzjGGuIYS3Y0j8xYH09Fs8eWTDvdRcCW7OD2NFcJwXSzvjx5p8iTHDgXxhzzQHPALhQCbp+sZkRaWZbwzim7438eQ/SAO/ffHdZ/Tdxs/p3mGeItLmxs3V5gAgrn3XWvyQvEMDdkrxufdlrR2Bod3HyHyWDl6iz4T4Mj4xKQ33nRyxkh4aWkkn3eHHs309Ct36P6Mgj25chfNM8Nc0yUS3+9/ecauyPNS99LjJO8vB+z/AKfkhDsvKs5WQB37sZ+yfmeCR5UB5LdZh7qoNAS8uSm8fy/mtSOeeXK7cc9pELW5xc3/ANxjHO7/ABD3T+5rVqi2r2kwbcpknlIyvza4g/xC1O12njlRWhJVWhJVRTkpxRuKU4qKByWUTktxUULktyJxSyoqlFFEFgorSwUQKA7UtBau0FkqiVVqiUFEoSVZKAlFe3So7eXeTRf3/wCVrtXRur+JC1n7NDzFDysfkuVdJYoeHk+rR9iP6ldL0nAdEXSRkAA2W1fFmv5qaRtmoYfiwFg+rfkeCD90WnO8RmySvEb7rvnXmm6bmte3kG/O06XH53NHI9PRYajXdR6OhfIJYgIpKcOA2iHCiKPy81rmq+zuGOPfE97Xt5aLBFjkd/mujlx+tJOVCZB8B/clals8rE6To8E0zsyRr3yOEcbPEbtIaxjQaYQKt27mvP0WzR8GgOOPyC8WJCQKIIPH7lko28WiUE4scd1jcpxDeXX+dLKOoLA6nCZHejb+5+asRqHtLhDsOOSuWPabrkBwo8/WlzTcuv8AWuN4mBKPRu8fVnvD+C44HLeNYsMtCShtCXLSISgcVZKW4oBJS3FE4pZKihKAoiUBKioqVWoggKK0AKtAdqWhtRARKEqlRRUJQlQlCUVuPRsZ8NxHeifLj6ro2kT3Tr4k2k/LjsFoHQUjbDT5j7fmt5kxywADs0gjsPP/AJlZ2jPwtLXGhx3+f1Cy+LMR50tawc4mg/g8D+CzMQsfF38vULLUe/8AFknhRuU6770k7A0LyibklStMrDnC/eAXomm49360ViHMttgC04SEAWf+6RLDX5NfF58BeXIl8vqilcOT3Xja/c76qslatGHYzg79Zjh9wuDAru2syVE4fI+i4LuW8WaZaElDuVErSLJQEqEoCUFEoCrJQEqKolAVZQlBLVoVEVESiiIgUUUQRUVFEUKEqKIrbOkvib/l/iupy/CoosI8WP8AF+f9VsuH3H1/mFFFFj3TLHM8/r/VRRStxloPhH5Ly5Hw/b+KpRWIS74Pz/khxlFEK8fUf+gf9D/BcGarUWsWKtCVai0yAoFFEAFCVFEUBQlRRFRRRRFf/9k="
comedy_sport_episode = Episode.new(listens: rand(1..2000), img_url: comedy_sports_img_url, title: "13: Quickly Kevin; will Glenn Murray Score? featuring Chris Scull", summary:  "A check in on our bands & celebs FPL league, regular special guests from the world of music, toddlers choosing captains, beer of the week, classic football tales unravelled, FPL tips from the experts, quizzes, nonsense and more", url: comedy_sports_url, length: rand(1..180), upvotes: rand(1..1000))
comedy_sport_episode.tags << Tag.where(tag: "Sport") << Tag.where(tag: "Comedy")
comedy_sport_episode.save

comedy_lifestyle_url = "https://open.spotify.com/episode/4Wvfck8x5WiOOKrlKixzAa"
comedy_lifestyle_img_url = "https://i1.sndcdn.com/avatars-000524590953-vcvore-t500x500.jpg"
comedy_sport_episode = Episode.new(listens: rand(1..2000), img_url: comedy_lifestyle_img_url, title: "Your Receipts: I'm married, but I'm fantasising about another man", summary:  "The Receipts Podcast is a fun, honest podcast fronted by three girls who are willing to talk about anything and everything. From relationships to situationships to everyday life experiences, you can expect unadulterated girl talk with no filter.", url: comedy_lifestyle_url, length: rand(1..180), upvotes: rand(1..1000))
comedy_sport_episode.tags << Tag.where(tag: "Comedy") << Tag.where(tag: "Lifestyle")
comedy_sport_episode.save

comedy_news_url = "https://open.spotify.com/episode/06dIg8hQ1xNLpr7v6jmGl9"
comedy_news_img_url = "https://i1.sndcdn.com/avatars-000222604011-mdg3ab-t500x500.jpg"
comedy_news_episode = Episode.new(listens: rand(1..2000), img_url: comedy_news_img_url, title: "NYC Stories, New Tesla, Tazer Does It Again, 20 Mill Cheek Challenge - 172", summary: "The 3 Shots Of Tequila Podcast is a fun and light heartedpodcast about any and everything, underneath the sun. From sex and relationships to religion and current affairs.", url: comedy_news_url, length: rand(1..180), upvotes: rand(1..500))
comedy_news_episode.tags << Tag.where(tag: "Comedy") << Tag.where(tag: "News")
comedy_news_episode.save


# creating additional category seeds for demo

comedy_tech_url = "https://open.spotify.com/episode/2tzLl6YeGh4xXrqQGq1dKk"
comedy_tech_img_url = "https://cdn.vox-cdn.com/uploads/chorus_asset/file/16235288/recode_pivot_podcast_kara_swisher.png"
comedy_tech_episode = Episode.new(listens: rand(1..2000), img_url: comedy_tech_img_url, title: "London gives Uber the boot, the billionaire's 2020 strategy, and streaming wars continue.", summary: "Kara and Scott talk about Uber getting kicked out of its biggest EU market, London. They parse out the ad, media and digital strategy of Michael Bloomberg in his quest for the White House.", url: comedy_tech_url, length: rand(1..180), upvotes: rand(1..500))
comedy_tech_episode.tags << Tag.where(tag: "Comedy") << Tag.where(tag: "Technology")
comedy_tech_episode.save

comedy_politics_url = "https://open.spotify.com/episode/3sRXLqMwSubHk1bM6E2TFL"
comedy_politics_img_url = "https://megaphone-prod.s3.amazonaws.com/podcasts/34814bf8-e860-11e8-8bb2-6f3e1a98c859/image/uploads_2F1553887433220-tm6mswb02ve-81b991f0edef1e2d49524f20aaa20a8f_2FTDS_EARS_EDITION_COVER_ART_2019.jpg"
comedy_politics_episode = Episode.new(listens: rand(1..2000), img_url: comedy_politics_img_url, title: "NATO Leaders Laugh at Trump Behind His Back | Brittany Howard", summary: "Underwater speakers help revitalize dying coral reefs, video captures NATO leaders gossiping about President Trump, and Brittany Howard discusses her debut solo album.", url: comedy_politics_url, length: rand(1..180), upvotes: rand(1..500))
comedy_politics_episode.tags << Tag.where(tag: "Comedy") << Tag.where(tag: "Politics")
comedy_politics_episode.save

comedy_culture_url = "https://open.spotify.com/episode/7LpCTpUSvHBAgU6kTRJeGm"
comedy_culture_img_url = "https://pbcdn1.podbean.com/imglogo/image-logo/3751525/channel_logo.jpg"
comedy_culture_episode = Episode.new(listens: rand(1..2000), img_url: comedy_culture_img_url, title: "Episode 58 - Week of November 25 - December 1", summary: "Full disclosure: there was a an original plan when we sat down that got scrapped after this episode. We were going to run a midroll ad and give you guys a bonus throwback as an add-on to this one episode week. However, after a discussion, and realizing it's December and we're all very busy, we decided against it. Just too much work. So we apologize for the pump fake towards the end. That being said, there was only one episode this week with US Thanksgiving. So it's not the longest episode. But we dug deep and had a pretty good discussion! We all agree, even Kamar, that Tulsi should have a good shot. But you'll have to listen to find out what we think will happen...", url: comedy_culture_url, length: rand(1..180), upvotes: rand(1..1000))
comedy_culture_episode.tags << Tag.where(tag: "Comedy") << Tag.where(tag: "Culture")
comedy_culture_episode.save

# creating unemployed developer seed

unemployed_url = "https://open.spotify.com/episode/6HshUNAT9fXv8f1QsoD6Fl"
unemployed_img_url = "data:image/jpeg;base64,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"
unemployed_episode = Episode.new(listens: 1999, img_url: unemployed_img_url, title: "How do you prepare for an interview?", summary: "We want to share our experiences as unemployed developers and what we been through as we continue to look to start our career.", url: unemployed_url, length: rand(1..180), upvotes: 955)
unemployed_episode.tags << Tag.where(tag: "Comedy") << Tag.where(tag: "Lifestyle")
unemployed_episode.save

# url_array = ['https://open.spotify.com/episode/5UQLUDVEz8PRN1aJlspoQH', 'https://open.spotify.com/episode/79g7Vn8Gi9MABPTH1txISF']
# url_array.each do |url|
#   Episode.create(title: Faker::Book.title, summary: Faker::Lorem.paragraph, length: rand(1..180), upvotes: rand(1..1000), url: url)
# end

# create first X sport seeds and last X comedy seeds
puts 'create sport episode tags'
Episode.first(10).each do |episode|
  EpisodeTag.create(tag_id:Tag.where('tag = ?', 'Sport').take.id, episode_id: episode.id)
  rand(1..4).times do
  EpisodeTag.create(tag_id:Tag.where('tag = ?', general_tags_for_demo.sample).take.id, episode_id: episode.id)
  end
end

puts 'create sport and comedy episode tags'



puts 'create comedy episode tags'
Episode.last(10).each do |episode|
  EpisodeTag.create(tag_id:Tag.where('tag = ?', 'Comedy').take.id, episode_id: episode.id)
  rand(1..4).times do
  EpisodeTag.create(tag_id:Tag.where('tag = ?', general_tags_for_demo.sample).take.id, episode_id: episode.id)
  end
end



puts 'create user seeds'


user = User.create!(username:"Joe", email:"joe@gmail.com", password:'123456', password_confirmation:'123456')

usernames = ["The Law Maker",
             "Kelly Not Clarkson",
             "The Only Way is Freddie",
             "The Muscle",
             "Pokemaster",
             "Master Backend-er",
             "Teach me how to Dougie",
             "Lil Fullstack",
             "Fanning iPhone 5/SE",
             "Bit Ifey"
            ]

profile_img_url = ["https://avatars2.githubusercontent.com/u/55364154?v=4",
             "https://avatars1.githubusercontent.com/u/49228294?v=4",
             "https://avatars3.githubusercontent.com/u/37777543?v=4",
             "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/fmtocdvrjoo78fd97oia.jpg",
             "https://avatars1.githubusercontent.com/u/54071094?v=4",
             "https://avatars1.githubusercontent.com/u/36269225?v=4",
             "https://ca.slack-edge.com/T02NE0241-UP684E30W-c6a5fbf16490-512",
             "https://ca.slack-edge.com/T02NE0241-UP5SXKTTR-e3895cbebddb-512",
             "https://ca.slack-edge.com/T02NE0241-U8S82NPEC-58777da6b785-192",
             "https://ca.slack-edge.com/T02NE0241-UD478BM6G-467bafc59648-512"
            ]
index=0
10.times do
user = User.create!(profile_img: profile_img_url[index], username:"#{usernames[index]} - 319", email:"test#{index}@gmail.com", password:'123456', password_confirmation:'123456')
index += 1
end

puts 'creating playlist seeds'

Playlist.create(name: "funemployed", user_id: User.all.first.id)
Playlist.create(name: "commute", user_id: User.all.first.id)
Playlist.create(name: "current affairs", user_id: User.all.first.id)
Playlist.create(name: "summer 2012", user_id: User.all.first.id)


puts 'create playlist episodes'

Playlist.first(4).each do |playlist|
  Episode.all.sample(rand(3..7)).each do |episode|
    PlaylistEpisode.create!(playlist: playlist, episode: episode)
  end
end

puts 'finished'


# Commented out until we work out how to implement Spotify / Podcasts API
# require 'rspotify'

# artists = RSpotify::Artist.search('Arctic Monkeys')
# puts artists
