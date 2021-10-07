require 'civilization.rb'

class Army
    attr_accessor :gold_amount
    def initialize(civilization)
        @gold_amount = 1000
        @fights_record = []
        @civilization = civilization
    end

    def train(unit)
        if(@gold_amount >= unit.training_cost)
            @gold_amount -= unit.training_cost
            unit.train
        end
    end

    def army 
        return @civilization.army
    end

    def updateArmy(newArmy)
        @civilization.army = newArmy
    end
    def totalStrength
        return @civilization.totalStrength
    end

    def transform(anUnit)
        if @gold_amount >= anUnit.transform_cost
            transformedUnit = anUnit.transform
            if transformedUnit != anUnit
                army.delete(anUnit)
                army << transformedUnit
            end
        end
    end

    def removeFirstTwoPowerfullUnits()
        armyOrderedByStrengthPoints = army.sort_by{|anUnit| anUnit.strength_points}
        @civilization.army = armyOrderedByStrengthPoints.drop(2)
    end
end