require 'pry'
class Waiter
  
    attr_accessor :name, :years

    @@all = []

    def initialize(name, years)
        @name = name
        @years = years
        @@all<< self
    end  
    
    def self.all
        @@all
    end

    def new_meal (customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        biggie = Meal.all.sort_by {|meal| meal.tip}[-1]
        biggie.customer
    end
end