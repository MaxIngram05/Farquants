extends Node2D
@onready var choice_one_button: Button = $HBoxContainer/ChoiceOneButton
@onready var choice_two_button: Button = $HBoxContainer/ChoiceTwoButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	choice_one_button.call_deferred("grab_focus")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if DialogueGlobal.is_mirror_talking:
		choice_one_button.text = "Fine, I'll learn"
		choice_two_button.text = "Of COURSE Not!"
	if DialogueGlobal.is_donkey_talking:
		choice_one_button.text = "Eat the Waffles"
		choice_two_button.text = "Destroy the Waffles"
	if DialogueGlobal.is_puss_talking:
		choice_one_button.text = "kitty"
		choice_two_button.text = "bad kitty"
	if DialogueGlobal.is_rumpel_talking:
		choice_one_button.text = "Sign The Contract"
		choice_two_button.text = "Refuse to Sign"

func _on_choice_one_button_pressed() -> void:
	if DialogueGlobal.is_mirror_talking:
		print("advance mirror to yes")


func _on_choice_two_button_pressed() -> void:
	if DialogueGlobal.is_mirror_talking:
		print("advance mirror to yes")
