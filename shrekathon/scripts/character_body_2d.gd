extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -200.0
const MAX_CHARGE_TIME = 1.0
const CHARGE_JUMP_MULTIPLIER = 2.5

var charge_time := 0.0
var is_charging := false
var charge_direction := 0.0


func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	var dir = 0;
	
	if is_on_floor():
		var left = Input.is_key_pressed(KEY_A)
		var right = Input.is_key_pressed(KEY_D)
		dir = float(right) - float(left)

	# Charging logic (hold Space)
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		is_charging = true
		charge_time = min(charge_time + delta, MAX_CHARGE_TIME)
		# Capture A/D direction while charging
		charge_direction = dir
		# Lock horizontal movement while charging
		velocity.x = 0.0
	elif (Input.is_action_just_released("ui_accept") and is_charging):
		# Release: launch with charged jump
		var charge_ratio = charge_time / MAX_CHARGE_TIME
		velocity.y = JUMP_VELOCITY * (1.0 + charge_ratio * (CHARGE_JUMP_MULTIPLIER - 1.0))
		velocity.x = charge_direction * SPEED * (1.0 + charge_ratio)
		is_charging = false
		charge_time = 0.0
		charge_direction = 0.0
	elif is_on_floor():
		# Normal horizontal movement
		if dir:
			velocity.x = dir * SPEED
		else:
			velocity.x = move_toward(velocity.x, charge_direction, SPEED)
	
	move_and_slide()
