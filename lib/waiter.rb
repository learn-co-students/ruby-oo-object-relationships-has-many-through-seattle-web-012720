class Waiter
    attr_accessor :name, :experience
    @@all = []
  
    def initialize(name, experience)
      @name = name
      @experience =experience
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
          meal.waiter == self #checking for waiter now
        end
    end

    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
          meal_a.tip <=> meal_b.tip
        end
       
        best_tipped_meal.customer
    end

    def frequent_customer
        most_frequent = meals.max_by {|meal_a, meal_b|
            meal_a
        }
        
    end
end