extends Control

const DIALOGUE_SCENE = preload("res://scenes/dialogue_panel.tscn")
@onready var outcome_image: TextureRect = $CenterContainer/OutcomeImage
@onready var dialogue_panel: Node2D = $dialogue_panel

var neutral_ending_image = 0
var bad_ending_image = preload("res://assets/shrek_bad_ending.png")
var good_ending_image= preload("res://assets/shrek_good_ending.png")
@onready var ending_label: RichTextLabel = $EndingLabel

var extra_fiona_dialogue

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# 1. Hide the ending UI initially
	outcome_image.modulate.a = 0
	ending_label.visible = false

	DialogueGlobal.prepare_fiona_ending()
	
	var dialogue = DIALOGUE_SCENE.instantiate()
	add_child(dialogue)
	
	dialogue.tree_exited.connect(_on_dialogue_finished)
	
	var outcomeTween = create_tween()

func _on_dialogue_finished():
	ending_label.visible = true
	var outcomeTween = create_tween()
	outcomeTween.tween_property(outcome_image, "modulate:a", 1, 3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if UnlockSystem.is_good_ending():
		outcome_image.texture = good_ending_image
		ending_label.text = "You got the [color=green]GOOD ENDING[/color]! You were nice to everyone and gained some new powers along the way"
	elif UnlockSystem.is_bad_ending():
		outcome_image.texture = bad_ending_image
		ending_label.text = "You got the [color=red]BAD ENDING[/color]! You were rude to everyone in your path and jumped your way across the mountain!"
	else:
		pass
