require_relative 'army.rb'
require_relative 'battle_record.rb'
require 'date'

class BattleManager
    def initialize(anArmy, anotherArmy)
        @anArmy = anArmy
        @anotherArmy = anotherArmy
    end

    def face_armies
        save_battle_record
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

    def save_battle_record
        save_battle_record_for_an_army(@anArmy, @anotherArmy)
        save_battle_record_for_an_army(@anotherArmy, @anArmy)
    end

    def save_battle_record_for_an_army(anArmy, enemyArmy)
        battle_time = Time.now
        battle_record = BattleRecord.new(enemyArmy, battle_time)
        anArmy.add_battle_record(battle_record)
    end

    def reward(aWinnerTeam)
        aWinnerTeam.gold_amount += 100
    end

    def punish(aLoserTeam)
        aLoserTeam.removeFirstTwoPowerfullUnits()
    end

    def draw()
        puts "Draw"
        remove_one_unit_to(@anArmy)
        remove_one_unit_to(@anotherArmy)
    end

    def remove_one_unit_to(army)
        army.remove_weakest_unit
    end
end