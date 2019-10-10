class Waiter
  attr_accessor
  attr_reader :name, :experience
  @@all = []

  def initialize(name, years)
    @name = name
    @experience = experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  def best_tipper
    best_tipped = meals[0]
    meals.each do |meal|
      if meal.tip > best_tipped.tip
        best_tipped = meal
      end
    end
    best_tipped.customer
  end
end
