extends CharacterBody2D
@onready var anim = $AnimatedSprite2D

const SPEED = 100.0
const JUMP_VELOCITY = -200.0
const WALL_JUMP_VELOCITY_Y = 20.0
const WALL_JUMP_VELOCITY_X = 20.0
const MAX_CHARGE_TIME = 1.0
const CHARGE_JUMP_MULTIPLIER = 2.5

var charge_time := 0.0
var is_charging := false
var charge_direction := 0.0
var jump_direction := 0.0

var is_jumping := false;

@export var speed_scale: float = 1.0  # Multiplier for movement (1.0 = normal, 0.2 = 20% speed)
@export var dir = 0;

@onready var right_wall: RayCast2D = $RightWall
@onready var left_wall: RayCast2D = $LeftWall
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	dir = 0;
	
	if is_on_floor():
		var left = Input.is_key_pressed(KEY_A)
		var right = Input.is_key_pressed(KEY_D)
		dir = (float(right) - float(left)) * speed_scale
		
	if !is_on_floor() and is_jumping:
		if right_wall.is_colliding() and jump_direction > 0:
			velocity.x -= WALL_JUMP_VELOCITY_X
			velocity.y -= WALL_JUMP_VELOCITY_Y
		if left_wall.is_colliding() and jump_direction < 0:
			velocity.x += WALL_JUMP_VELOCITY_X
			velocity.y -= WALL_JUMP_VELOCITY_Y

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
		jump_direction = charge_direction
		is_jumping = true
		charge_time = 0.0
		charge_direction = 0.0
	elif is_on_floor():
		# Normal horizontal movement
		is_jumping = false
		if dir:
			velocity.x = dir * SPEED
		else:
			velocity.x = move_toward(velocity.x, charge_direction, SPEED)
	
	move_and_slide()

	# Animation and sprite flip
		# Animation logic - put this BEFORE move_and_slide()
	# Animation logic
	if is_charging:
		# Use "idle" if you haven't made a "charging" animation yet
		anim.play("landing") 
	elif not is_on_floor():
		# Use "idle" or a specific "jump" frame if you have one
		anim.play("jumping")
	elif dir > 0:
		anim.play("walking_right")
	elif dir < 0:
		anim.play("walking_left")
	else:
		anim.play("idle")
