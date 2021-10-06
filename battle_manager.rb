require_relative 'army.rb'

class BattleManager
    def initialize(anArmy, anotherArmy)
        @anArmy = anArmy
        @anotherArmy = anotherArmy
    end

    def face_armies
        if @anArmy.totalStrength > @anotherArmy.totalStrength
            puts "You Win"
            reward(@anArmy)
            punish(@anotherArmy)
        
        elsif @anArmy.totalStrength < @anotherArmy.totalStrength
            puts "You Lose"
            reward(@anotherArmy)
            punish(@anArmy)
        else
            draw() 
        end
    end

    def reward(aWinnerTeam)
        aWinnerTeam.gold_amount += 100
    end

    def punish(aLoserTeam)
        aLoserTeam.removeFirstTwoPowerfullUnits()
    end

    def draw()
        puts "Draw"
        @anArmy.gold_amount -= 30
        @anotherArmy.gold_amount -= 30
    end
end