class VentureCapitalist
    @@all = []
    @@domains = []

    attr_accessor :name, :total_worth
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def offer_contract(startup, round, amount)
        FundingRound.new(startup, self, round, amount)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist.name == self.name}
    end

    def portfolio
        self.funding_rounds.map {|round| round.startup}
    end

    def biggest_investment
        self.funding_rounds.sort_by {|round| round.investment}.last
    end

    def invested(domain) 
        self.funding_rounds.select {|round| round.startup.domain == domain}.map {|round| round.investment}.reduce(:+)
    end

    def self.tres_commas_club
        self.all.select {|vc| vc.total_worth >= 1000000000 }
    end

    def self.all 
        @@all
    end
end
