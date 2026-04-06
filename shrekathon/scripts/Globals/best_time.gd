extends Node

var best_time := 0
var current_time := 0

func calculate_best_time(total_time_in_secs):
	current_time = total_time_in_secs
	if (best_time == 0 or total_time_in_secs <= best_time):
		best_time = total_time_in_secs
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
