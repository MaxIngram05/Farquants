extends Control

const DIALOGUE_SCENE = preload("res://scenes/dialogue_panel.tscn")
@onready var outcome_image: TextureRect = $CenterContainer/OutcomeImage

var good_ending_image = 0
var neutral_ending_image = 0
var bad_ending_image = preload("res://assets/shrek_bad_ending.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	outcome_image.texture = bad_ending_image


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
