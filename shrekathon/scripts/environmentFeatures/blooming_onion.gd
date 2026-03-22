extends StaticBody2D

@export var knockback_force: float = 400.0  # Adjust this to control knockback strength

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_damage_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Shrek(player)":
		print("Hoppin dih dih dih")
		apply_knockback(body)
		body.play_hit_sound()

func apply_knockback(player: Node2D) -> void:
	# Calculate direction from onion to player (direction player came from)
	var knockback_direction = (player.global_position - global_position).normalized()
	
	# Apply velocity to push player backward
	if player.has_method("set_velocity"):
		# If player has a set_velocity method
		player.velocity = knockback_direction * knockback_force
	elif player.has_property("velocity"):
		# If player has a velocity property
		player.velocity = knockback_direction * knockback_force
	else:
		# Fallback: directly modify position
		player.global_position += knockback_direction * 50
