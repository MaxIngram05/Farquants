
extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Shrek(player)":
		get_tree().change_scene_to_file("res://scenes/ending.tscn")

func _ready() -> void:
	body_entered.connect(_on_body_entered)
