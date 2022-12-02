extends Node2D

var stats = WaterStats




func _ready():
	stats.connect("no_water", self, "queue_free")


func _on_Hurtbox_area_entered(area):
	stats.water -= 1
