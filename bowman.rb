require'combat_unit.rb'
class Bowman < CombatUnit
    def initialize
        super(10)
        @points_by_training = 7
        @training_cost = 20
        @transform_cost = 40
    end

    def transform
        return Knight.new
    end
end