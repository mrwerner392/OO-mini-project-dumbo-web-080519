class User

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def recipe_cards
        RecipeCard.all.select {|card| card.user == self}
    end
    
    def recipes
        (self.recipe_cards.map {|card| card.recipe}).uniq
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(self, recipe, rating, date)
    end

    def declare_allergy(ingredient)
        Allergy.new(self, ingredient)
    end

end


