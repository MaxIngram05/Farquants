extends Node2D

@export var rise_speed: float = 60.0
@export var PLAYER_START_POSITION := Vector2(-200, 100)

var is_active: bool = false
var starting_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	starting_position = global_position
	hide()
	set_process(false)
	add_top_fire()
	$DamageArea2D/CollisionShape2D.disabled = true

func add_top_fire() -> void:
	var screen_width = 2000
	var sprite_width = 16
	var amount_needed =  screen_width / sprite_width

	# We skip '0' because you already have the original sprite
	for i in range(1, amount_needed):
		var new_fire = $AnimatedSprite2D.duplicate()
		add_child(new_fire)
		# Move each new sprite 32 pixels to the right
		new_fire.position.x = i * sprite_width - 450
		new_fire.play("default") # Make sure they are all dancing


func start_fire():
	if is_active: 
		return
	
	is_active = true
	show() 
	set_process(true) # Start the _process loop (movement)
	$DamageArea2D/CollisionShape2D.set_deferred("disabled",false)
	print("The floor is fire!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.y -= rise_speed * delta


func _on_trigger_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Shrek(player)":

		start_fire()
		$TriggerArea2D/CollisionShape2D.set_deferred("disabled", true)
		print("start fire")

func _on_damage_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Shrek(player)":
		# Reset player and fire
		body.global_position = PLAYER_START_POSITION
		reset_fire()
		print("touched fire")

func reset_fire():
	is_active = false
	hide()
	set_process(false)
	global_position = starting_position
	$DamageArea2D/CollisionShape2D.set_deferred("disabled",true)
	$TriggerArea2D/CollisionShape2D.set_deferred("disabled", false)
