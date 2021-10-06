$LOAD_PATH << '.'
require_relative 'pikeman.rb'
require_relative 'bowman.rb'
require_relative 'knight.rb'
require_relative 'civilization.rb'
require_relative 'chinese_civilization.rb'
require_relative 'english_civilization.rb'
require_relative 'bizantine_civilization.rb'
require_relative 'army.rb'
require_relative 'battle_manager.rb'

aPikeman = Pikeman.new
aBowman = Bowman.new
aKnight = Knight.new
aChineseCivilization = ChineseCivilization.new
anotherChineseCivilization = ChineseCivilization.new
anEnglishCivilization = EnglishCivilization.new
aBizantineCivilization = BizantineCivilization.new

puts "Pikeman strength: #{aPikeman.strength_points}"
puts "Bowman strenght: #{aBowman.strength_points}"
puts "Knight strenght: #{aKnight.strength_points}"
puts aChineseCivilization.army.length
puts anEnglishCivilization.army.length
puts aBizantineCivilization.army.length

#creating armies
myChineseArmy = Army.new(aChineseCivilization)
enemyArmy = Army.new(anotherChineseCivilization)

puts "myArmy's total strength: #{myChineseArmy.totalStrength}"
puts "myArmy's total gold: #{myChineseArmy.gold_amount}"

aPikemanToBeTrained = myChineseArmy.army.select {|unit| unit.class == Pikeman}.first
aBowmanToBeTrained = myChineseArmy.army.select {|unit| unit.class == Bowman}.first
aKnightToBeTrained = myChineseArmy.army.select {|unit| unit.class == Knight}.first

myChineseArmy.train(aPikemanToBeTrained)
myChineseArmy.train(aBowmanToBeTrained)
myChineseArmy.train(aKnightToBeTrained)

puts "myArmy's total strength after training: #{myChineseArmy.totalStrength}"
puts "myArmy's total gold: #{myChineseArmy.gold_amount}"

#for i in 0..100
#    myChineseArmy.train(aKnightToBeTrained)
#end

puts "myArmy's total strength after training: #{myChineseArmy.totalStrength}"
puts "myArmy's total gold: #{myChineseArmy.gold_amount}"

aPikemanToBeTransformed = myChineseArmy.army.select {|unit| unit.class == Pikeman && unit.strength_points == 5}.first
aBowmanToBeTransformed = myChineseArmy.army.select {|unit| unit.class == Bowman && unit.strength_points == 10}.first
aKnightToBeTransformed = myChineseArmy.army.select {|unit| unit.class == Knight && unit.strength_points == 20}.first

myChineseArmy.transform(aPikemanToBeTransformed)
amountOfPikemen = myChineseArmy.army.select{|unit| unit.class == Pikeman}.length
puts "Amount of pikemen: #{amountOfPikemen}"
myChineseArmy.transform(aBowmanToBeTransformed)
myChineseArmy.transform(aKnightToBeTransformed)



battle_manager = BattleManager.new(myChineseArmy, enemyArmy)
battle_manager.face_armies

