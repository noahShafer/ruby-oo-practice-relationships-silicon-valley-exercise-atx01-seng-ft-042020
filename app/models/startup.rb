class Startup
    @@all = []
    @@domains = []

    attr_accessor :name
    attr_reader :founder, :domain
    def initialize(name, founder)
        @name = name
        @founder = founder
        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name= name
        @@domains << @domain
    end

    def sign_contract(vc, round, amount)
        FundingRound.new(self, vc, round, amount)
    end

    def self.find_by_founder(name)
        self.all.find {|startup| startup.founder == name}
    end

    def num_of_funding_rounds
        FundingRound.all.select {|round| round.startup.name == self.name}.count
    end

    def total_funds
        FundingRound.all.select {|round| round.startup.name == self.name}
    end

    def investors
        self.total_funds.map {|round| round.venture_capitalist}.uniq
    end

    def big_investors 
        self.investors.select {|vc| VentureCapitalist.tres_commas_club.include?(vc)}
    end

    def self.domains
        @@domains.uniq
    end

    def self.all 
        @@all
    end
end