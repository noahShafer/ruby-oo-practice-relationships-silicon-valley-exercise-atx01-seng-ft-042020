require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
hops = Startup.new("Hops", "Ryan")
twitter = Startup.new("Twitter", "Jack Dorsey")
twitter.pivot("Service industry", "Twitter")
p hops.name
p hops.founder
p hops.domain
hops.pivot("Service industry", "Barpal")
p hops.name
p hops.domain
p Startup.find_by_founder("Ryan")
p Startup.domains

andressen = VentureCapitalist.new("Marc Andressen", 10000000000)
koum = VentureCapitalist.new("Jan Koum", 20000000000)
dude = VentureCapitalist.new("Some Dude", 100000)
p andressen.name
p andressen.total_worth
p VentureCapitalist.tres_commas_club

hops.sign_contract(andressen, "angel", 250000)
hops.sign_contract(dude, "angel", 10000)
koum.offer_contract(hops, "angel", 500000)
andressen.offer_contract(twitter, "Series A", 2000000)

p hops.total_funds
p hops.num_of_funding_rounds
p hops.investors
p hops.big_investors
p ""

p andressen.funding_rounds
p andressen.portfolio
p andressen.biggest_investment
p andressen.invested("Service industry")







# binding.pry
0 #leave this here to ensure binding.pry isn't the last line