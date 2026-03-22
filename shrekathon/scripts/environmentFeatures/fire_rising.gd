extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Let's say your screen is 2000 pixels wide
	var screen_width = 2000
	var sprite_width = 16
	var amount_needed = screen_width / sprite_width

	# We skip '0' because you already have the original sprite
	for i in range(1, amount_needed):
		var new_fire = $AnimatedSprite2D.duplicate()
		add_child(new_fire)
		# Move each new sprite 32 pixels to the right
		new_fire.position.x = i * sprite_width - 450
		new_fire.play("default") # Make sure they are all dancing


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_trigger_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.

func _on_damage_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
