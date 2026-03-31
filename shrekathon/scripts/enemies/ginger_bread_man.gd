extends Node2D

@export var knockback_force: float = 10000
@export var min_movement_speed: float = 70.0
@export var movement_speed: float = 140.0
@export var movement_interval: float = 2.0
@export var minX:float = 0
@export var maxX := 200.0

var movement_timer: float = 0.5
var current_direction: int = 1  # 1 for right, -1 for left
var current_speed: float = 0.0
var knocked_player: CharacterBody2D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Ensure initial position is inside allowed range.
	global_position.x = clamp(global_position.x, minX, maxX)
	min_movement_speed = min(min_movement_speed, movement_speed)
	current_speed = randf_range(min_movement_speed, movement_speed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	movement_timer += delta
	scale.x = current_direction * 0.5
	
	# Every movement_interval seconds, update direction and speed.
	if movement_timer >= movement_interval:
		movement_timer = 0.0
		update_direction_based_on_screen_position()
		min_movement_speed = min(min_movement_speed, movement_speed)
		current_speed = randf_range(min_movement_speed, movement_speed)

	# Continuous movement.
	global_position.x += current_speed * current_direction * delta
	global_position.x = clamp(global_position.x, minX, maxX)

	# Continuous knockback while player is inside damage area.
	if knocked_player != null:
		apply_knockback(knocked_player, delta)

func update_direction_based_on_screen_position() -> void:
	var screen_center = minX + ((maxX - minX) / 2.0)
	
	if global_position.x < screen_center:
		current_direction = 1  # Move right
	else:
		current_direction = -1  # Move left

func get_rand_distance():
	# Random distance in [0, movement_speed], then apply direction.
	return randf_range(0.0, movement_speed) * current_direction

func _on_damage_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Shrek(player)":
		print("GGB man")
		if body is CharacterBody2D:
			knocked_player = body
			body.play_hit_sound()

func _on_damage_area_2d_body_exited(body: Node2D) -> void:
	if body == knocked_player:
		knocked_player = null

func apply_knockback(player: CharacterBody2D, delta: float) -> void:
	var knockback_direction = Vector2(float(current_direction), 0.0)
	# Apply knockback continuously over time
	player.velocity += knockback_direction * knockback_force * delta
