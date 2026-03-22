extends BaseNPC


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Area of Donkey is: ", $DonkeyArea.name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Shrek(player)":
		print("Donkey says: 'Press E to talk!'")


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Shrek(player)":
		print("Donkey says: 'I miss my wife'")
