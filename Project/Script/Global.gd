extends Node
#Computer
var _is_open = false
var _in_computer = false

#DayNightFilter
var inside = false

#Character
var stop_character = false
var basic_move_speed = 75
var move_speed = 75

#Clicker
var fur : int = 2000
var multiply : int = 1
var fur_per_second = 0

var upgrade_1 = false
var upgrade_1_price = 50
var upgrade_2 = false
var upgrade_2_price = 100
var upgrade_3 = false
var upgrade_3_price = 250
var upgrade_4 = false
var upgrade_4_price = 1000
var upgrade_5 = false
var upgrade_6 = false

func _process(delta: float) -> void:
	upgrades_multiply()

func upgrades_multiply():
	if upgrade_1 == true:
		multiply = 2

	if upgrade_2 == true:
		fur_per_second = 1

	if upgrade_3 == true:
		fur_per_second = 3
		
	if upgrade_4 == true:
		multiply = 4
