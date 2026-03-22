extends Node

var icons = {
	"shrek": 0,
	"donkey": 1,
	"pussBoots": 2,
	"rumpel": 3,
	"mirror": 4,
	"fiona": 5
}

var mirror_dialogue = 0
var donkey_dialogue = 0
var puss_dialogue = 0
var rumpel_dialogue = 0
var fiona_dialogue = 0

var donkey_choice_text = 0
var puss_choice_text = 0
var rumpel_choice_text: Array[String] = ["Sign The Contract", "Refuse to Sign"]
var mirror_choice_text: Array[String] = ["Fine, I'll learn", "No"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
