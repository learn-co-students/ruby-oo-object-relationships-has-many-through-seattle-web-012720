class Customer
    attr_accessor :name , :age
    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip)
        meal = Meal.new(waiter, self, total, tip)
        meal
    end

    def meals
        Meal.all.filter {|meal_obj| meal_obj.customer == self }
    end

    def waiters
        meals.map do |meal|
            meal.waiter
        end
    end

end