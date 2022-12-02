extends Node

export(int) var max_water = 1 setget set_max_water
var water = max_water setget set_water

signal no_water
signal water_changed(value)
signal max_water_changed(value)

func set_water(value):
	water = value
	emit_signal("water_changed", water)
	if water <= 0:
		emit_signal("no_water")

func set_max_water(value):
	max_water = value
	self.water = min(water, max_water)
	emit_signal("max_water_changed", max_water)

func _ready():
	self.water = max_water
