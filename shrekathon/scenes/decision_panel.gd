extends Node2D
@onready var choice_one_button: Button = $HBoxContainer/ChoiceOneButton
@onready var choice_two_button: Button = $HBoxContainer/ChoiceTwoButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	choice_one_button.call_deferred("grab_focus")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_choice_one_button_pressed() -> void:
	get_tree().quit()


func _on_choice_two_button_pressed() -> void:
	get_tree().quit()
