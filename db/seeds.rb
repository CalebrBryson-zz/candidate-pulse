# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
candidates = Candidate.create([{name: 'Donald Trump', party: 'Republican'}, {name: 'Hilary Clinton', party: 'Democrat'},
  {name: 'Ben Carson', party: 'Republican' }, {name: 'Rand Paul', party: 'Republican'},
  {name: "Martin O'Malley", party: 'Democrat'}, {name: 'Bernie Sanders', party: 'Democrat'},
  {name: 'Jeb Bush', party: 'Republican'}, {name: 'Chris Christie', party: 'Republican'},
  {name: 'Ted Cruz', party: 'Republican'}, {name: 'Carly Fiorina', party: 'Republican'},
  {name: 'Jim Gilmore', party: 'Republican'}, {name: 'Lindsey Graham', party: 'Republican'},
  {name: 'Mike Huckabee', party: 'Republican'}, {name: 'John Kasich', party: 'Republican'},
  {name: 'George Pataki', party: 'Republican'}, {name: 'Marco Rubio', party: 'Republican'},
  {name: 'Rick Santorum', party: 'Republican'}, {name: 'Jill Stein', party: 'Independent'}])

authors = Author.create([{name: '@realDonaldTrump', candidate_id: 1}, {name: '@HillaryClinton',
  candidate_id: 2}, {name: '@RealBenCarson', candidate_id: 3}, {name: '@RandPaul', candidate_id: 4},
  {name: '@MartinOMalley', candidate_id: 5}, {name: '@BernieSanders', candidate_id: 6},
  {name: '@JebBush', candidate_id: 7},
  {name: '@ChrisChristie', candidate_id: 8}, {name: '@tedcruz',  candidate_id: 9},
  {name: '@CarlyFiorina', candidate_id: 10}, {name: '@gov_gilmore',  candidate_id: 11},
  {name: '@LindseyGrahamSC', candidate_id: 12},
  {name: '@GovMikeHuckabee', candidate_id: 13}, {name: '@JohnKasich', candidate_id: 14},
  {name: '@GovernorPataki', candidate_id: 15}, {name: '@marcorubio', candidate_id: 16},
  {name: '@RickSantorum', candidate_id: 17}, {name: '@DrJillStein', candidate_id: 18}])
