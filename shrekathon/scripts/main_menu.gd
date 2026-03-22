extends Control
@onready var credits_button: Button = $CenterContainer/VBoxContainer/CreditsButton
@onready var max_sfx_player: AudioStreamPlayer = $MaxSFXPlayer
@onready var v_box_container: VBoxContainer = $CenterContainer/VBoxContainer


func _ready() -> void:
	credits_button.layout_mode = 2
	v_box_container.hide()


func _process(delta: float) -> void:
	pass



func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/DialogueMaking/dialogueTestLevel.tscn")


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()




func _on_max_button_pressed() -> void:
	print("max!")
	max_sfx_player.pitch_scale = randf_range(0.9, 1.3)
	max_sfx_player.play()
	v_box_container.show()
