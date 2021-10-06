class CombatUnit
    attr_reader :strength_points, :training_cost, :transform_cost
    
    def initialize(strength_points)
        @strength_points = strength_points
    end

    def train
        @strength_points += @points_by_training
    end
end