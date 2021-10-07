class BattleRecord
    def initialize(enemy, battle_date)
        @enemy = enemy
        @battle_date = battle_date
    end

    def print_record
        puts "You have battled against #{@enemy} the #{@battle_date}"
    end
end