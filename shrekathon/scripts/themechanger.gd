class_name MusicLayerTrigger
extends Area2D

@export var layer_index: int = 0
@export var trigger_once: bool = true

@onready var music_manager = $"../../MusicManager"

var _triggered := false

func _on_body_entered(body: Node2D) -> void:
	if trigger_once and _triggered:
		return
	if not body.is_in_group("player"):
		return
		
	print("Triggered a theme change!")
	_triggered = true
	music_manager.unlock_layer(layer_index)
