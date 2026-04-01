extends Node

@onready var layers: Array[AudioStreamPlayer] = [
	$LevelMusicPlayer2, $LevelMusicPlayer3
]

@onready var triggers: Array[Area2D] = [
	$"../ThemeChanger/ThemeChanger1", $"../ThemeChanger/ThemeChanger2"
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(1, layers.size()):
		layers[i].volume_db = -80.0
	for i in range(1, triggers.size()):
		triggers[i]._triggered = false
	

func unlock_layer(index: int) -> void:
	if index >= layers.size():
		return
	var tween := create_tween()
	tween.tween_property(layers[index], "volume_db", 0.0, 2.0)
