require 'pry'
require_relative 'waiter'
require_relative 'meal'
require_relative 'customer'

howard = Customer.new("Howard", 30)
daniel = Customer.new("Daniel", 30)
terrance = Waiter.new("Terrance", 1)
joe = Waiter.new("Joe", 10)
esmery = Waiter.new("Esmery", 2)
andrew = Waiter.new("Andrew", 3)
        
howard.new_meal(terrance, 15, 2)
howard.new_meal(joe, 15, 4)
howard.new_meal(andrew, 15, 5)
daniel.new_meal(terrance, 20, 1)
daniel.new_meal(esmery, 15, 3)

binding.pry
