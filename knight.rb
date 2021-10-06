require'combat_unit.rb'
class Knight < CombatUnit
    def initialize
        super(20)
        @points_by_training = 10
        @training_cost = 30
        @transform_cost = 0
    end

    def transform
        puts 'This unit reached the max class and cannot be transformed'
        return self
    end
end