extends Area2D

const PLAYER_SPEED = 150.0  # Match the player's SPEED constant
@export var speed_multiplier: float = 0.6  # 0.6 = 60% of max speed
@export var jump_multiplier: float = 0.2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	# This checks if the object has physics (CharacterBody2D or RigidBody2D)
	if body is CharacterBody2D or body is RigidBody2D:
		print(body.name + " entered the sludge!")
		print("wyd mud")

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D or body is RigidBody2D:
		# Reset speed_scale when leaving the slow area
		if body.name == "Shrek(player)":
			body.speed_scale = 1.0
			body.jump_scale = 1.0
		print(body.name + " escaped the sludge!")

func _physics_process(_delta: float) -> void:
	# 1. Get a list of everyone currently standing inside the area
	var overlapping_bodies = get_overlapping_bodies()
	
	# 2. Loop through every object found
	for body in overlapping_bodies:
		# 3. If it's something that moves (like Shrek)
		if body.name == "Shrek(player)":
			# Scale down the player's movement by the speed_multiplier
			body.speed_scale = speed_multiplier	
			body.jump_scale = jump_multiplier
			
