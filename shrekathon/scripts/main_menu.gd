extends Control


func _ready() -> void:
	var vbox = $CenterContainer/VBoxContainer
	var credits_button = Button.new()
	credits_button.text = "Credits"
	credits_button.layout_mode = 2
	credits_button.pressed.connect(_on_credits_button_pressed)
	# Insert before QuitButton (index 1)
	vbox.add_child(credits_button)
	vbox.move_child(credits_button, 1)


func _process(delta: float) -> void:
	pass


func _on_play_button_pressed() -> void:
	pass # Replace with function body.


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
