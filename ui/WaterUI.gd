extends Control

var water = 4 setget set_water
var max_water = 4 setget set_max_water

onready var waterBar = $WaterBar

func set_water(value):
	water = clamp(value, 0, max_water)
	
	water = range_lerp(water, 0, max_water, waterBar.min_value, waterBar.max_value)
	if waterBar != null:
		waterBar.value = water

func set_max_water(value):
	max_water = max(value, 1)
	self.water = min(water, max_water)


func _ready():
	self.max_water = WaterStats.max_water
	self.water = WaterStats.water
# warning-ignore:return_value_discarded
	WaterStats.connect("water_changed", self, "set_water")
# warning-ignore:return_value_discarded
	WaterStats.connect("max_water_changed", self, "set_max_water")
