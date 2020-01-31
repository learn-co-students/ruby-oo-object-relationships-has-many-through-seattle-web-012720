require 'pry'

class Waiter

    attr_accessor :name, :yrs_experience

    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end

        best_tipped_meal.customer
    end

    #untested code - working in pry!

    def most_frequent_customer
        frequent_customer = {}
        meals.each do |meal|
            if frequent_customer[meal.customer]
                frequent_customer[meal.customer] += 1
            else 
                frequent_customer[meal.customer] = 1
            end
        end
        frequent_customer.reduce(nil) do |memo, (customer, num)|
            memo.nil? ? memo = customer : memo
            if num > frequent_customer[memo]
                memo = customer
            end
            memo
        end
    end

    def worst_tippers_meal
        #find a waiters worst tipping customer instance
        #return that meal object
        worst_tipped_meal = meals.min do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end
    end

    def self.most_experienced_waiter
        all.max_by {|waiter| waiter.yrs_experience}
    end

    def self.least_experienced_waiter
        all.min_by {|waiter| waiter.yrs_experience}
    end

    def avg_tips
        tip_total = meals.sum {|meal| meal.tip}
        tip_avg = tip_total/meals.count
    end

    def self.most_experienced_waiter_tips
        most_experienced_waiter.avg_tips
    end

    def self.least_experienced_waiter_tips
        least_experienced_waiter.avg_tips
    end
end