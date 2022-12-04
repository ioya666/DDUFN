extends KinematicBody2D
const bulletPath = preload("res://Player/Bullet.tscn")

var velocity = Vector2.ZERO
var top_speed = 1
var acceleration = 40
var friction = 40
var ammo = 1
var reloadtime = 1

func _ready():
	var timer = Timer.new()
	timer.wait_time = reloadtime
	timer.autostart = true
	add_child(timer)
	timer.connect("timeout", self, "on_timeout")

func _physics_process(delta):
	if Input.is_action_just_pressed("p2_shoot"):
		shoot()
	$Node2D.look_at(get_global_mouse_position())
	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("p1_right") - Input.get_action_strength("p1_left")
	input_vector.y = Input.get_action_strength("p1_down") - Input.get_action_strength("p1_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * top_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(input_vector * top_speed, friction * delta)
	move_and_collide(velocity)
	
func shoot():
	var hasAmmo : bool = ammo > 0
	if not hasAmmo: 
		return
	var bullet = bulletPath.instance()
	get_parent().add_child(bullet)
	bullet.position = $Node2D/Position2D.global_position
	bullet.velocity = get_global_mouse_position() - bullet.position
	ammo = ammo - 1

func on_timeout():
	ammo = 1
