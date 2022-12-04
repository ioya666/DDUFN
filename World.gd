extends Node2D

var enemy = load("res://Enemy/Enemy.tscn")
var spawntime = 5

func _ready():
	var timer = Timer.new()
	timer.wait_time = spawntime
	timer.autostart = true
	add_child(timer)
	timer.connect("timeout", self, "on_timeout")

func on_timeout():
	var rand = RandomNumberGenerator.new()
	var screen_size = get_viewport().get_visible_rect().size
	
	for i in range(0,40):
		var enem = enemy.instance()
		rand.randomize()
		var x = rand.randf_range(0, screen_size.x)
		rand.randomize()
		var y = rand.randf_range(0, screen_size.y)
		enem.position.y = y
		enem.position.x = x
		add_child(enem)
