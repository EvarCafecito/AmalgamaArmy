require 'pikeman.rb'
require 'bowman.rb'
require 'knight.rb'

class Civilization
    attr_accessor :army
    def initialize(pikemen_amount, bowmen_amount, knights_amount)
        @army = []
        create_army(pikemen_amount, Pikeman)
        create_army(bowmen_amount, Bowman)
        create_army(knights_amount, Knight)
    end

    def create_army(amount, unitType)
        if amount > 0
            for i in 1..amount
                @army << unitType.new
            end
        end
    end

    def totalStrength
        totalStrength = 0
        for i in 0..(@army.length-1)
            totalStrength += @army[i].strength_points
        end
        return totalStrength
    end
end