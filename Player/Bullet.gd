extends KinematicBody2D
var velocity = Vector2.ZERO
var speed = 300
var maxtime = 1

func _ready():
	var timer = Timer.new()
	timer.wait_time = maxtime
	timer.autostart = true
	add_child(timer)
	timer.connect("timeout", self, "on_timeout")

func on_timeout():
	self.queue_free()

func _physics_process(delta):
	var collision_info = move_and_collide(velocity.normalized() * delta * speed)


func _on_Hitbox_area_entered(area):
	queue_free()
