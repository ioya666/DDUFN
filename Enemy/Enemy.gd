extends KinematicBody2D

onready var water = get_parent().get_node("WaterBarrel")


var velocity = Vector2.ZERO
var top_speed = 0.5
var acceleration = 10
var friction = 400



func _ready():
	pass 

func _physics_process(delta):
	if is_instance_valid(water):
		run_towards_point(water.global_position, delta)
	move_and_collide(velocity)


func run_towards_point(point, delta):
	var direction = global_position.direction_to(point)
	velocity = velocity.move_toward(direction * top_speed, acceleration * delta)


func _on_Hurtbox_area_entered(area):
	queue_free()


func _on_Hitbox_area_entered(area):
	queue_free()
