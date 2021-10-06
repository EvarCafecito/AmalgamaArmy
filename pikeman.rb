require 'combat_unit.rb'
class Pikeman < CombatUnit
    def initialize
        super(5)
        @points_by_training = 3
        @training_cost = 10
        @transform_cost = 30
    end

    def transform
        return Bowman.new
    end
end