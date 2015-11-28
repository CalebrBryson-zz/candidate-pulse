# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
candidates = Candidate.create([{name: 'Donald Trump', party: 'Republican'}, {name: 'Hilary Clinton', party: 'Democrat'},
  {name: 'Ben Carson', party: 'Republican' }, {name: 'Rand Paul', party: 'Republican'}])

authors = Author.create([{name: '@realDonaldTrump', candidate_id: 1}, {name: '@HillaryClinton', candidate_id: 2}] )

tweets = Tweet.create([{author_id: 1, text: "@tweetybird2009: @GulfWarVet123 That's why @realDonaldTrump's THE MAN. CANNOT BE BOUGHT BY #Establishment #Media #PUNDITS. #TheyRMad",
   num_favorites: 1600 , num_retweets: 676}])

htags = Hashtag.create([{htag: '#Establishment', tweet_id: 1},{ htag: '#Media', tweet_id: 1},  { htag: '#PUNDITS', tweet_id: 1},{ htag: '#TheyRMad', tweet_id: 1}])
