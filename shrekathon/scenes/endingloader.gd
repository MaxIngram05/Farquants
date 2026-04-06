
extends Area2D

@onready var timer = $"../CanvasLayer/Control"

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Shrek(player)":
		get_tree().change_scene_to_file("res://scenes/ending.tscn")
		BestTime.calculate_best_time(timer.total_time_in_secs)
		timer.stop_timer()

func _ready() -> void:
	body_entered.connect(_on_body_entered)
