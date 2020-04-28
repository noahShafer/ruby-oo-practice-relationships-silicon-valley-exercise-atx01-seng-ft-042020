class FundingRound
    @@all = []
    @@domains = []

    attr_reader :startup, :venture_capitalist, :investment
    attr_accessor :type
    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        self.investment = investment
        @@all << self
    end

    def investment=(amount)
        if amount >= 0 
            @investment = amount
        else
            p "amount must be greater than 0"
        end 
    end

    def self.all 
        @@all
    end
end
